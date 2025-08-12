#!/bin/bash

# Java Video Compression - Clean Script
# This script cleans all build artifacts

set -e  # Exit on any error

echo "🧹 Cleaning Java Video Compression project..."

# Make sure Maven wrapper is executable
chmod +x ./mvnw

echo "🗑️  Removing build artifacts..."
./mvnw clean

echo "✅ Project cleaned successfully!"
echo "Run ./build.sh to rebuild the project"
