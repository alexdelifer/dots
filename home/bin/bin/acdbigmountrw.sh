#!/bin/bash
rclone mount -vv --acd-templink-threshold 0 --stats 1s --allow-other --buffer-size 1G --max-read-ahead 200M secret:/ ~/acd/
