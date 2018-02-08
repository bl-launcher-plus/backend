#!/bin/bash
find ./ -type f -exec sha256sum {} \; > checksums.sha256 
