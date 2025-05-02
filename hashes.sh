#!/bin/bash

BASE=$(pwd)

(echo \(define %hashes \(list

for BRANCH in kernelpanicroom dalaptop; do
    echo -ne \(list \"$BRANCH\"\ 

    if [ -d /tmp/checkout ]; then rm -fr /tmp/checkout; fi

    git clone $BASE -b $BRANCH /tmp/checkout 2> /dev/null
    pushd /tmp/checkout > /dev/null

    echo -ne \"$(git rev-parse HEAD)\"\ 
    echo -ne \"$(guix hash -rx .)\"\)
    echo

    popd > /dev/null
done

echo \)\)) | scmfmt
