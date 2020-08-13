#!/usr/bin/env bash

for filename in $(dirname "$0")/cuenca/*.sh; do
    $filename
done
