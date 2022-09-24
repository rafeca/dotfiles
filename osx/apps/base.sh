#!/usr/bin/env bash

for filename in $(dirname "$0")/base/*.sh; do
    $filename
done
