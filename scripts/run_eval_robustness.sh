#!/bin/bash

problems=(
  problem/anml/overcooked-hier-dur.tutorial-salad.pb.anml
  problem/anml/overcooked-hier-dur.tutorial-salads.pb.anml
  problem/anml/overcooked-hier-dur.tutorial-tomato-salad.pb.anml
  problem/anml/overcooked-hier-dur.burger-deadline.pb.anml
)

heuristics=(
  "dfs,ord-dec,soca"
  "dfs,makespan,ord-dec,soca"
  "dfs,ord-dec,makespan,soca"
  "dfs,robust,ord-dec,soca"
  "dfs,ord-dec,robust,soca"
)

for heuristic in "${heuristics[@]}"; do
  java -jar fape-planning-assembly-1.0.jar --timeout 1000 -n 5 -o evaluation_robustness.csv -p $heuristic ${problems[@]}
done
