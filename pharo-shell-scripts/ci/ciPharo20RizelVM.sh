#!/bin/bash

# stop the script if a single command fails
set -e 

# ARHUMENT HANDLING ===========================================================

if { [ "$1" = "-h" ] || [ "$1" = "--help" ]; }; 
    echo "This script will download the latest Pharo 2.0 image and the Rizel Benchmarking VM

Result in the current directory:
    vm               VM directory
    vm.sh            Script forwarding to the VM in vm
    Pharo.image      The latest pharo image
    Pharo.changes    The corresponding pharo changes"
    exit 0
elif [ $# -gt 0 ]; then
    echo "--help is the only argument allowed"
    exit 1
fi

# FETCH DATA ==================================================================
wget --quiet -qO - http://pharo.gforge.inria.fr/ci/script/ciRizelVM.sh | bash
wget --quiet -qO - http://pharo.gforge.inria.fr/ci/script/ciPharo20.sh | bash
