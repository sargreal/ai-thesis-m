#!/bin/bash
# fape_version="1.0+66-1f82cbd6+20240105-1406"
# fape_path="/root/master-thesis/fape/planning/target/fape-planning-assembly-${fape_version}.jar"

# java -jar $fape_path "$@"

set +x

cd /root/master-thesis/fape

Command="fape-planning/fgRun -v $@"

sbt --error "$Command"