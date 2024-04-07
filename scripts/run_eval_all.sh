#!/bin/bash

nohup scripts/run_eval_htn.sh > logs/eval_htn.log &

nohup scripts/run_eval_robustness.sh > logs/eval_robustness.log &