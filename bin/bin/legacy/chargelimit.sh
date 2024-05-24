#!/bin/sh
# Battery start threshold with coreboot: 0x35 = 53 %
ectool -w 0xb0 -z 0x35
# Stop threshold 0x50 = 80%
ectool -w 0xb1 -z 0x55
