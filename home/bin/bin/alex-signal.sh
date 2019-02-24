#!/bin/bash
signal-cli -u +15147128969 send "$@" +15147128969
notify-send "$* sent to alex"
