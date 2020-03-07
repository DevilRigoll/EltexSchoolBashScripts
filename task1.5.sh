#!/usr/bin/env bash
sed 's/root\ /Admin:/g'
ls -l | sed 's/d\*\ /Directory:/g'

#ls -l | sed '\^d\*\s/\d\*\ /Directory:/g'
