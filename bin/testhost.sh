#!/bin/bash

$ha_testcmd $1

if [ $? -eq 0 ]; then
  echo $2 1
else
  echo $2 0
fi
