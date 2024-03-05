#!/bin/bash

# Define the parameters

set -e

common_parameters=(
  "--timeout 100"
  "--interval 100"
  "/root/master-thesis/ai-thesis-m/problem/anml/overcooked2-min.tutorial.pb.anml"
)

parameters=(
  '--preparable-tasks m_chop,m_prepare_tableware,m_arrange,m_transport_to,m_fetch,m_get_to --tasks "order_lettuce_salad(client1)@deadline=100;order_lettuce_salad(client2)@delay=80@deadline=180;order_lettuce_salad(client3)@delay=160@deadline=260;order_lettuce_salad(client4)@delay=240@deadline=340"'
  '--preparable-tasks m_chop --tasks "order_lettuce_salad(client1)@deadline=100;order_lettuce_salad(client2)@delay=80@deadline=180;order_lettuce_salad(client3)@delay=160@deadline=260;order_lettuce_salad(client4)@delay=240@deadline=340"'
  '--tasks "order_lettuce_salad(client1)@deadline=100;order_lettuce_salad(client2)@delay=80@deadline=180;order_lettuce_salad(client3)@delay=160@deadline=260;order_lettuce_salad(client4)@delay=240@deadline=340"'
)

cd /root/master-thesis/fape

# Loop through the parameters and run fape/acting
for param in "${parameters[@]}"; do
  echo "Running fape/acting with parameters: ${common_parameters[*]} $param"
  Command="fape-acting/run -v ${common_parameters[*]} $param"
  sbt "$Command"
done
