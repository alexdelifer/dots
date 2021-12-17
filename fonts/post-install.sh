#!/bin/bash
echo "fonts :: Rebuilding Font Cache."
fc-cache -r -v > /dev/null
