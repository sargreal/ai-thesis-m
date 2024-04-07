#!/bin/bash

problems=(
  problem/anml/overcooked.burger.pb.anml 
  problem/anml/overcooked-hier.burger.pb.anml
  problem/anml/overcooked-dur.burger.pb.anml
  problem/anml/overcooked-hier-dur.burger.pb.anml
  problem/anml/overcooked.burgers.pb.anml 
  problem/anml/overcooked-hier.burgers.pb.anml
  problem/anml/overcooked-dur.burgers.pb.anml
  problem/anml/overcooked-hier-dur.burgers.pb.anml
)

java -jar fape-planning-assembly-1.0.jar --timeout 1000 -n 5 -o eval_htn.csv ${problems[@]}