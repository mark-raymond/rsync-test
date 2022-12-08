#!/bin/sh

cp initial.bin test.bin

rsync --no-whole-file --inplace -S new.bin test.bin

cmp new.bin test.bin
