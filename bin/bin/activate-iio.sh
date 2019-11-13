#!/bin/bash
#timeout 5s tail -f '/sys/bus/iio/devices/iio:device'*/*raw*
watch -n 0.5 cat '/sys/bus/iio/devices/iio:device'*/*raw*  >/dev/null 2>&1 &
