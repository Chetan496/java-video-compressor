# Technical Design Document: Java Video Compression Library

## 1. Overview

A reusable Java library that provides video compression capabilities using FFmpeg. The library supports single video compression with configurable settings and cross-platform execution.

## 2. System Architecture

### 2.1 High-Level Architecture
```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Client App    │───▶│  Compression     │───▶│   FFmpeg        │
│                 │    │  Library API     │    │   Wrapper       │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
                       ┌──────────────────┐    ┌─────────────────┐
                       │  Configuration   │    │  Native FFmpeg  │
                       │  Management      │    │  Binaries       │
                       └──────────────────┘    └─────────────────┘
```

### 2.2 Core Components

1. **VideoCompressor** - Main API interface
2. **CompressionConfig** - Configuration object for compression settings
3. **FFmpegWrapper** - Native binary execution wrapper
4. **PlatformDetector** - OS detection utility
5. **FileManager** - Input/output file handling

## 3. Key Design Decisions

### 3.1 Input Handling
- Support both byte arrays and file paths
- Create temporary files for byte array inputs
- Automatic cleanup of temporary resources

### 3.2 Cross-Platform Support
- Bundle FFmpeg binaries for Windows and Linux
- Runtime OS detection and binary selection
- Extract binaries from JAR to temporary directory at runtime

### 3.3 Compression Configuration
- Three compression modes: Lossy, Lossless, Max Compression
- Configurable output format (default MP4)
- Simple configuration object

### 3.4 Processing Strategy
- Single video processing at a time
- Chunked processing for large files to manage memory
- Synchronous processing with clear progress indication

## 4. Supported Features

### 4.1 Video Formats
- Common input formats: MP4, AVI, MOV, MKV, WMV, FLV, WebM
- Default output: MP4 with H.264 video and AAC audio

### 4.2 Compression Types
- **Lossy**: Standard compression with quality trade-off
- **Lossless**: Maintains original quality
- **Max Compression**: Aggressive compression for smallest file size

## 5. API Design

### 5.1 Main Interface
```java
public interface VideoCompressor {
    CompressionResult compress(byte[] videoData, CompressionConfig config);
    CompressionResult compress(String filePath, CompressionConfig config);
}
```

### 5.2 Configuration Object
```java
public class CompressionConfig {
    private CompressionType type; // LOSSY, LOSSLESS, MAX_COMPRESSION
    private String outputFormat; // Default: "mp4"
    private String outputPath; // Optional, auto-generated if not provided
}
```

### 5.3 Result Object
```java
public class CompressionResult {
    private String outputPath;
    private long originalSize;
    private long compressedSize;
    private double compressionRatio;
    private boolean success;
    private String errorMessage;
}
```

## 6. Error Handling

### 6.1 Exception Types
- `VideoCompressionException` - Base exception for all compression errors
- `UnsupportedFormatException` - When input format is not supported
- `FFmpegExecutionException` - When FFmpeg process fails

### 6.2 Basic Validation
- Check if input file exists and is readable
- Validate configuration parameters
- Verify FFmpeg binary availability

## 7. Testing Strategy

### 7.1 Unit Tests
- Configuration object validation
- Platform detection logic
- File handling operations
- Mock FFmpeg execution

### 7.2 Integration Tests
- Real video file compression with sample files
- Cross-platform binary execution
- Different compression modes

### 7.3 Test Resources
- Small sample videos in common formats (MP4, AVI, MOV)
- Test videos of different resolutions

## 8. Implementation Details

### 8.1 Binary Management
- FFmpeg binaries stored in `src/main/resources/binaries/`
- Windows: `ffmpeg.exe`
- Linux: `ffmpeg`
- Extract to system temp directory on first use

### 8.2 Process Execution
- Use ProcessBuilder for FFmpeg execution
- Capture stdout/stderr for debugging
- Handle process timeouts

### 8.3 Temporary File Management
- Create temp files for byte array inputs
- Generate unique output filenames if not specified
- Clean up temporary files after processing
