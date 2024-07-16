#!/bin/bash


# -- install any updates 
apt-get update -y

# -- install any binary library dependenceis
apt-get install $(cat $(dirname $0)/libs | tr '\n' ' ') -y --no-install-recommends


