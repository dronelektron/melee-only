#!/bin/bash

PLUGIN_NAME="melee-only"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
