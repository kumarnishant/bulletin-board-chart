#!/bin/bash
currentSlot=$(helm get values --all jolly-turtle| grep productionSlot| awk '{print $2}')
if [[ "$currentSlot" == blue ]]; then
    newSlot="green"
else
    newSlot="blue"
fi
deploymentOption=productionSlot=$newSlot
helm upgrade jolly-turtle bulletin-board-0.1.0.tgz --set $deploymentOption  --reuse-values
