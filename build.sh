#!/bin/bash

# Java Video Compression - Build Script
# This script builds the project using Maven Wrapper (no Maven installation required)

set -e  # Exit on any error

echo "🔨 Building Java Video Compression project..."

# Check if Java is installed and version
if ! command -v java &> /dev/null; then
    echo "❌ Error: Java is not installed or not in PATH"
    echo "Please install Java 17 or higher"
    exit 1
fi

# Get Java version (handle different Java version output formats)
JAVA_VERSION_OUTPUT=$(java -version 2>&1 | head -n 1)
if [[ $JAVA_VERSION_OUTPUT == *"1.8"* ]]; then
    JAVA_VERSION=8
elif [[ $JAVA_VERSION_OUTPUT =~ \"([0-9]+) ]]; then
    JAVA_VERSION=${BASH_REMATCH[1]}
else
    # Fallback: try to extract version number
    JAVA_VERSION=$(echo $JAVA_VERSION_OUTPUT | sed -n 's/.*"\([0-9]*\).*/\1/p')
fi

if [ -z "$JAVA_VERSION" ] || [ "$JAVA_VERSION" -lt 17 ]; then
    echo "❌ Error: Java 17 or higher is required. Current version output: $JAVA_VERSION_OUTPUT"
    exit 1
fi

echo "✅ Java version: $JAVA_VERSION_OUTPUT"

# Make sure Maven wrapper is executable
chmod +x ./mvnw

echo "🧹 Cleaning previous builds..."
./mvnw clean

echo "📦 Compiling and packaging..."
./mvnw package

# Check if build was successful
if [ -f "target/java-video-compression-1.0.0.jar" ]; then
    echo "✅ Build successful!"
    echo "📁 JAR file created: target/java-video-compression-1.0.0.jar"
    echo ""
    echo "To run the application, use: ./run.sh [arguments]"
else
    echo "❌ Build failed - JAR file not found"
    exit 1
fi
