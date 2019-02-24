#!/bin/bash
sudo flashrom -c "MX25L6405" -p internal:laptop=force_I_want_a_brick -w "$@"
