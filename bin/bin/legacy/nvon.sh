#!/bin/bash
#modprobe nvidia_uvm
#modprobe nvidia_modeset
#modprobe nvidia
tee /proc/acpi/bbswitch <<< ON
cat /proc/acpi/bbswitch
