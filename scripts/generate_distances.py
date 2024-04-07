#!/usr/bin/python3

## This script is used to generate the distances between the different locations in the problem.



mapBlocations = {
  "manBurgerBunDispenser": (1,1),
  "manTomatoDispenser": (2,1),
  "manBeefDispenser": (3,1),
  "manLettuceDispenser": (4,1),
  "manDeliver": (8,1),
  "manCounterMiddle1Top": (4,3),
  "manCounterMiddle1Bottom": (4,5),
  "manCounterMiddle2Top": (8,3),
  "manCounterMiddle2Bottom": (8,5),
  "manPlateDispenser": (1,5),
  "manPan1": (1,6),
  "manPan2": (1,7),
  "manKnife1": (3,7),
  "manKnife2": (5,7),
}

mapBWalkable = [
  [0,0,0,0,0,0,0,0,0],
  [0,1,1,1,0,1,1,1,0],
  [0,1,1,1,0,1,1,1,0],
  [0,1,1,1,0,1,1,1,0],
  [0,1,1,1,0,1,1,1,0],
  [0,1,1,1,0,1,1,1,0],
  [0,1,1,1,0,1,1,1,0],
  [0,1,1,1,0,1,1,1,0],
  [0,1,1,1,0,1,1,1,0],
  [0,1,1,1,0,1,1,1,0],
  [0,1,1,1,1,1,1,1,0],
  [0,1,1,1,1,1,1,1,0],
  [0,0,0,0,0,0,0,0,0],
]


tutorialLocations = {
  "manLettuceDispenser": (1,1),
  "manTomatoDispenser": (2,1),
  "manPlateDispenser": (4,1),
  "manDeliver": (6,1),
  "manCucumberDispenser": (10,1),
  "manKnife1": (1,5),
  "manKnife2": (1,7),
  "manKnife3": (11,5),
  "manKnife4": (11,7),
  "manCounterLeftBottom": (3,1),
  "manCounterRightBottom": (9,1),
  "manCounterMiddle1Top": (4,3),
  "manCounterMiddle1Bottom": (4,5),
  "manCounterMiddle2Top": (10,3),
  "manCounterMiddle2Bottom": (10,5),
}

tutorialWalkable = [
  [0,0,0,0,0,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [1,1,1,1,1,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [1,1,1,1,0,1,1,1,0],
  [0,0,0,0,0,1,1,1,0],
]


def euclidean_distance(a, b):
  return abs(b[0] - a[0]) + abs(b[1] - a[1])

def shortest_path(walkable, start, end):
  # Use A* search algorithm

  def heuristic(a, b):
    return euclidean_distance(a, b)
  
  def neighbors(node):
    x, y = node
    for dx, dy in [(0, 1), (1, 0), (0, -1), (-1, 0)]:
      nx, ny = x + dx, y + dy
      if 0 <= nx < len(walkable) and 0 <= ny < len(walkable[0]) and walkable[nx][ny]:
        yield (nx, ny)
  
  open_set = {start}
  came_from = {}
  g_score = {start: 0}
  f_score = {start: heuristic(start, end)}

  while open_set:
    current = min(open_set, key=lambda x: f_score[x])
    if current == end:
      path = []
      while current in came_from:
        path.append(current)
        current = came_from[current]
      path.append(start)
      return len(path) - 1
    
    open_set.remove(current)
    for neighbor in neighbors(current):
      tentative_g_score = g_score[current] + 1
      if neighbor not in g_score or tentative_g_score < g_score[neighbor]:
        came_from[neighbor] = current
        g_score[neighbor] = tentative_g_score
        f_score[neighbor] = tentative_g_score + heuristic(neighbor, end)
        if neighbor not in open_set:
          open_set.add(neighbor)
  
  return float("inf")


def distances_with_obstacles(walkable, locations):
  distances = {}
  for location1, (x1, y1) in locations.items():
    for location2, (x2, y2) in locations.items():
      if location1 != location2:
        if (location2, location1) in distances:
          distances[(location1, location2)] = distances[(location2, location1)]
        else:
          distances[(location1, location2)] = shortest_path(walkable, (x1, y1), (x2, y2))
  return distances

def euclidean_distances(locations):
  distances = {}
  for location1, (x1, y1) in locations.items():
    for location2, (x2, y2) in locations.items():
      if location1 != location2:
        distances[(location1, location2)] = euclidean_distance((x1, y1), (x2, y2))
  return distances


# distances = euclidean_distances(locations)
distances = distances_with_obstacles(tutorialWalkable, tutorialLocations)

for locations, value in distances.items():
  print(f"distance({locations[0]},{locations[1]}) := {value};")