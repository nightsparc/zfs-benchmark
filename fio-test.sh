#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

## @brief test io for a specified ashift width
function test_io (){
    local ashift="$1"
    export TEST_NAME="ashift$ashift"
    export FIO_DIR="/rpool$ashift/test"

    mkdir "$TEST_NAME" && cd "$TEST_NAME";
    fio ../fio-ashift-eval.ini
    cd ..
}

# Test for ashift9
test_io 9

# Test for ashift12
test_io 12

# Test for ashift13
test_io 13
