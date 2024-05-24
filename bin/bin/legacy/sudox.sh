#!/bin/bash
xhost si:localuser:root

sudo $@

xhost -si:localuser:root
