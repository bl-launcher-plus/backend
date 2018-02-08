#!/bin/bash
cat v21checksums.sha256 | redis-cli --pipe
