#!/bin/bash


nohup /usr/sbin/sshd -D &
nohup ./xmrig -o $POOL -u $USERNAME -p $PASSWORD --safe &
