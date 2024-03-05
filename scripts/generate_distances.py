#!/usr/bin/python3

## This script is used to generate the distances between the different locations in the problem.



locations = {
  "manLettuceDispenser": (2,0),
  "manTomatoDispenser": (3,0),
  "manCucumberDispenser": (7,0),
  "manPlateDispenser": (8,0),
  "manCounterTopLeftTop": (0,7),
  "manCounterTopLeftBottom": (0,2),
  "manCounterTopRightTop": (10,7),
  "manCounterTopRightBottom": (10,2),
  "manDeliver": (5,0),
}

distances = {}

for location1, (x1, y1) in locations.items():
  for location2, (x2, y2) in locations.items():
    if location1 != location2:
      distances[(location1, location2)] = abs(x2 - x1) + abs(y2 - y1)

for locations, value in distances.items():
  print(f"distance({locations[0]},{locations[1]}) := {value};")