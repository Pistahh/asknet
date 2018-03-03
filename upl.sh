#!/bin/bash

D=root@10.0.0.41

scp output/*.deb $D:/tmp
ssh $D dpkg -i /tmp/*.deb
