#!/bin/bash
rmmod nvidia_uvm
rmmod nvidia_modeset
rmmod nvidia
tee /proc/acpi/bbswitch <<< OFF
cat /proc/acpi/bbswitch
