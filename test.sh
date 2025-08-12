#!/bin/bash

# Java Video Compression - Test Script
# This script runs all tests using Maven Wrapper

set -e  # Exit on any error

echo "🧪 Running tests for Java Video Compression..."

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Error: Java is not installed or not in PATH"
    echo "Please install Java 17 or higher"
    exit 1
fi

# Make sure Maven wrapper is executable
chmod +x ./mvnw

echo "🔍 Running unit tests..."
./mvnw test

echo "✅ All tests completed!"
