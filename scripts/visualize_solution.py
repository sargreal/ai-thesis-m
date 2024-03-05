#!/usr/bin/python3

## This script is used to visualize the solution of the problem as an svg file.
# The input is a solution file of the form:
# 0:     m1-order_lettuce_salad(client1) (id:0)                              started: 0            min-duration: 131   
# 0:     m1-m_chop(lettuce5) (id:1)                                          started: 0            min-duration: 62    
# 0:     m2-m_transport_to(lettuce5, counterTopRightTop) (id:3)              started: 0            min-duration: 37    
# 0:     m2-m_fetch(cook1, lettuce5) (id:8)                                  started: 0            min-duration: 13    
# 0:     m3-m_get_to(cook1, manLettuceDispenser) (id:10)                     started: 0            min-duration: 8     
# 0:     m2-m_get_to(cook1, floorLeftBottom) (id:12)                         started: 0            ended: 5     
# 0:     a_move(cook1, floorMidBottom, floorLeftBottom) (id:13)              started: 0            ended: 5     
# 6:     a_move(cook1, floorLeftBottom, manLettuceDispenser) (id:11)         started: 6            min-duration: 2     
# 8:     a_pick_up(cook1, lettuce5) (id:9)                                   earliest-start: 8     min-duration: 5     
# 13:    m3-m_get_to(cook1, manCounterTopRightTop) (id:14)                   earliest-start: 13    min-duration: 19    
# 13:    m3-m_get_to(cook1, floorRightTop) (id:16)                           earliest-start: 13    min-duration: 17    
# 13:    m3-m_get_to(cook1, floorMidTop) (id:18)                             earliest-start: 13    min-duration: 12    
# 13:    m3-m_get_to(cook1, floorMidBottom) (id:20)                          earliest-start: 13    min-duration: 7     
# 13:    m2-m_get_to(cook1, floorLeftBottom) (id:22)                         earliest-start: 13    min-duration: 2     
# 13:    a_move(cook1, manLettuceDispenser, floorLeftBottom) (id:23)         earliest-start: 13    min-duration: 2     
# 15:    a_move(cook1, floorLeftBottom, floorMidBottom) (id:21)              earliest-start: 15    min-duration: 5     
# 20:    a_move(cook1, floorMidBottom, floorMidTop) (id:19)                  earliest-start: 20    min-duration: 5     
# 25:    a_move(cook1, floorMidTop, floorRightTop) (id:17)                   earliest-start: 25    min-duration: 5     
# 30:    a_move(cook1, floorRightTop, manCounterTopRightTop) (id:15)         earliest-start: 30    min-duration: 2     

import re
import argparse
import numpy as np

def get_row_of_action(occupied_times: np.ndarray, action_id):
    # Find the row in occupied_times where the the value equals the action_id
    for i in range(occupied_times.shape[0]):
        if np.any(occupied_times[i] == action_id):
            return i
    return None

def find_free_row(occupied_times: np.ndarray, start, end, action_id, parent_id):
    # If the action has a parent, it should be placed in the row beneath the parent
    min_row = 0
    if parent_id is not None:
        parent_row = get_row_of_action(occupied_times, parent_id)
        if parent_row is not None:
            min_row = parent_row + 1
        else:
            print(f"Parent action {parent_id} of action {action_id} not found")
    for i in range(occupied_times.shape[0]):
        if i >= min_row and np.all(occupied_times[i, start:end] == -1):
            occupied_times[i, start:end] = action_id
            return occupied_times, 50 + 50 * i
    new_row = np.zeros((1, occupied_times.shape[1]))
    new_row.fill(-1)
    new_occupied_times = np.vstack((occupied_times, new_row))
    new_occupied_times[-1, start:end] = action_id
    return new_occupied_times, 50 + 50 * (new_occupied_times.shape[0] - 1)


def main():
    
    # Parse the command line arguments
    parser = argparse.ArgumentParser(description='Visualize the solution of the problem as an svg file.')
    parser.add_argument('solution_file', type=str, help='The solution file to visualize')
    parser.add_argument('-o', '--output', type=str, help='The output svg file')
    args = parser.parse_args()


    with open(args.solution_file, 'r') as f:
        lines = f.readlines()

    # Parse the solution file
    actions = []
    total_end = 0
    for line in lines:
        match = re.match(r'^.*(\d+):\s*([\w-]+)\(([\w,\s]+)\)\s*\(id:(\d+)(?:,parent:(\d+))?\)\s*(?:(?:started:|earliest-start:) (\d+))\s*(?:(?:ended:|min-duration:) (\d+))', line)
        if match:
            time = int(match.group(1))
            action = match.group(2)
            arguments = match.group(3)
            action_id = int(match.group(4))
            parent_id = int(match.group(5)) if match.group(5) is not None else None
            start = int(match.group(6))
            end = start + int(match.group(7)) if "min-duration" in line else int(match.group(7))
            total_end = max(total_end, end)
            actions.append((time, action, arguments, action_id, parent_id, start, end))
        else:
            print(f"Line {line} does not match the expected format")

    # Sort the actions by id
    actions = sorted(actions, key=lambda x: x[3])
    # print("\n".join(map(lambda t: str(t), actions)))

    # Generate the svg file
    svg_file = args.solution_file + ".svg" if args.output is None else args.output
    with open(svg_file, 'w') as f:
        width = 50 + total_end * 50
        height = 50 + 50 * len(actions)
        f.write(f'<svg width="{width}" height="{height}" xmlns="http://www.w3.org/2000/svg">\n')
        f.write(f'<rect x="0" y="0" width="{width}" height="{height}" fill="white" />\n')

        # Track occupied times for each existing row, to put actions into free spaces. free spaces are -1
        
        occupied_times = np.zeros((1, total_end))
        occupied_times.fill(-1)


        # Draw the actions
        for (time, action, arguments, action_id, parent_id, start, end) in actions:
            x = 50 + start * 50
            width = (end - start) * 50
            occupied_times, y = find_free_row(occupied_times, start, end, action_id, parent_id)
            is_action = action.startswith('a')
            style = f"fill: {'lightgreen' if is_action else 'lightgray'}; stroke: black; stroke-width: 1px;"
            f.write(f'<g transform="translate({x},{y})">\n  <rect x="0" y="0" width="{width}" height="40" style="{style}" />\n')
            f.write(f'  <text x="{5}" y="{20}" font-family="Verdana" font-size="12" fill="black">{action}({arguments})</text>\n</g>\n')

        f.write('</svg>\n')

    print("Solution visualized in " + svg_file)

if __name__ == "__main__":
    main()