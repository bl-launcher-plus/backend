#!/bin/bash
cat checksums.sha256 | redis-cli --pipe
