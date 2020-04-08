#!/bin/bash

for i in $@
do
    yarn application -kill $i
    echo "killed yarn application: $i"                                                                                                                                                                           
done
