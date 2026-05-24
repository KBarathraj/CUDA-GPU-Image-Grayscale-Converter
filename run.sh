#!/bin/bash

echo "=============================================="
echo "Building CUDA OpenCV Project (Linux/Unix)..."
echo "=============================================="

# Compile using the Makefile
make clean
make

if [ $? -eq 0 ]; then
    echo ""
    echo "Build successful! Processing images..."
    ./processImages
else
    echo ""
    echo "Build failed. Please check for errors."
fi
