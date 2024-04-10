#!/bin/python3

import os
import sys
import json
import random
import subprocess
import re
import csv

fape_path = "/root/master-thesis/fape"

common_params = [
  "--timeout", "300",
  "--interval", "100",
  "--planning-timeout", "120",
  "-v",
  "/root/master-thesis/ai-thesis-m/problem/anml/overcooked2-min.burgers.pb.anml",
]

clients = [
  "client1",
  "client2",
  "client3",
  "client4",
  "client5",
]

possible_tasks = [
  "order_lettuce_salad($Client)",
  "order_lettuce_tomato_salad($Client)",
]

task_min_time = [
  100,
  150,
]

def create_task(task: str,client:str,delay,deadline):
  return f"{task.replace('$Client', client)}@delay={delay}@deadline={deadline}"

def create_random_task_list(density=1):
  task_list = []
  min_delay = 0
  max_deadline = 0
  for i,client in enumerate(clients):
    task = random.choice(possible_tasks)
    delay = 0 if i== 0 else min_delay + random.randint(0,100)
    min_time = task_min_time[possible_tasks.index(task)]
    deadline = delay + random.randint(min_time, 2*min_time)
    task_list.append((task,client,delay,deadline))
    if density <= len(task_list):
      # The density describes how many tasks are scheduled in parallel
      task_necessarily_before = task_list[-density]
      min_delay = task_necessarily_before[3]
    max_deadline = max(deadline, max_deadline)
  return list(map(lambda t: create_task(*t), task_list)), max_deadline

def get_last_timepoint(output):
  last_timepoint = 0
  for line in output.split("\n"):
    match = re.search(r"\[(\d+)\]",line)
    if match:
      value = int(match.group(1))
      last_timepoint = max(last_timepoint, value)
  return last_timepoint

def execute_task_list(task_list, additional_args = []):
  task_list_str = ";".join(task_list)
  args = common_params + [" --tasks",f"\"{task_list_str}\""] + additional_args
  print(args)
  process = subprocess.Popen(["sbt", f"fape-acting/run {' '.join(args)}"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, cwd=fape_path)

  output = ""
  printing = False
  while process.poll() is None:
    line = process.stdout.readline().decode('utf-8')
    output += line
    # if "running (fork)" in line:
    printing = True
    if printing:
      print(line, end="")

  last_executed_timepoint = get_last_timepoint(output)
  
  if process.returncode != 0:
    return last_executed_timepoint, "Error"
  elif "Inconsistent network" in output:
    return last_executed_timepoint, "Inconsistent"
  elif "No plan exists" in output:
    return last_executed_timepoint, "Failure"
  elif "Planning timed out" in output:
    return last_executed_timepoint, "Timeout"
  elif "Shutting down from dispatching" in output or "Shutting down from idle" in output:
    return last_executed_timepoint, "Success"
  else:
    return last_executed_timepoint, "Unknown"


def evaluate(count, density, additional_args):
  for i in range(count):
    task_list, limit = create_random_task_list(density)
    print(task_list)
    last_executed_timepoint, result = execute_task_list(task_list,additional_args)
    yield i, task_list, limit, last_executed_timepoint, result
  return

def main():
  count = 1
  variants = {
    "default": ["--plan-selection", "dfs,ord-dec,soca"],
    "robust-second": ["--plan-selection", "dfs,robust,ord-dec,soca"],
    "robust-third": ["--plan-selection", "dfs,ord-dec,robust,soca"],
  }
  with open("results.csv", "w") as f:
    csv_writer = csv.writer(f)
    csv_writer.writerow(["variant", "density","id", "task_list", "limit", "last_executed_timepoint", "result"])
    for variant, additional_args in variants.items():
      random.seed(2)
      print(f"Evaluating variant {variant}")
      for density in range(1,5):
        for result in evaluate(count, density, additional_args):
          csv_writer.writerow([variant,density]+list(result))
          f.flush()

# print(create_random_task_list(1))
# print(create_random_task_list(2))
# print(create_random_task_list(3))
# print(create_random_task_list(4))
# print(create_random_task_list(5))
# print(create_random_task_list(6))

# if __name__ == "__main__":
#   main()
          
# execute_task_list(['order_lettuce_salad(client1)@delay=0@deadline=300', 'order_lettuce_salad(client2)@delay=10@deadline=150', 'order_lettuce_tomato_salad(client3)@delay=284@deadline=441', 'order_lettuce_tomato_salad(client4)@delay=391@deadline=622', 'order_lettuce_tomato_salad(client5)@delay=495@deadline=779'], ["--plan-selection", "dfs,ord-dec,soca"])
# execute_task_list(['m_chop(lettuce1)@delay=0@deadline=150', 'm_chop(lettuce2)@delay=1@deadline=150', 'm_chop(lettuce3)@delay=10@deadline=110' ], ["--plan-selection", "dfs,ord-dec,soca", "--flaw-selection", "hier,ogf,abs,lcf,eogf", "-v"])
execute_task_list(['order_lettuce_tomato_burger(client1)@delay=0@deadline=300'])