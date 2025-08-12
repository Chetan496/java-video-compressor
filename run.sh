#!/bin/bash

# Java Video Compression - Run Script
# This script runs the compiled JAR file

set -e  # Exit on any error

JAR_FILE="target/java-video-compression-1.0.0.jar"

echo "🚀 Running Java Video Compression..."

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Error: Java is not installed or not in PATH"
    echo "Please install Java 17 or higher"
    exit 1
fi

# Check if JAR file exists
if [ ! -f "$JAR_FILE" ]; then
    echo "❌ Error: JAR file not found: $JAR_FILE"
    echo "Please run ./build.sh first to build the project"
    exit 1
fi

echo "✅ Found JAR file: $JAR_FILE"

# Run the application with all passed arguments
echo "🎬 Starting video compression application..."
java -jar "$JAR_FILE" "$@"
