# Java Video Compression Library

A reusable Java library that provides video compression capabilities using FFmpeg. The library supports cross-platform execution, configurable compression settings, and handles both file path and byte array inputs.

## Features

- Cross-platform support (Windows and Linux)
- Multiple compression modes (Lossy, Lossless, Maximum Compression)
- Support for common video formats (MP4, AVI, MOV, MKV, WMV, FLV, WebM)
- File path and byte array input support
- Bundled FFmpeg binaries
- Clean API with comprehensive error handling

## Documentation

### Project Documentation
- [Requirements](docs/requirements.md) - Project requirements and specifications
- [Technical Design](docs/technical-design.md) - High-level architecture and design decisions
- [Low-Level Design](docs/low-level-design.md) - Detailed class diagrams and implementation design

### Design Diagrams
All design diagrams are available as both PlantUML source files and PNG images in the `diagrams/` folder:
- Class diagram showing system architecture
- Sequence diagrams for compression workflows
- Component interaction diagrams
- State and activity diagrams
- Exception hierarchy visualization

## Quick Start

```java
// Create configuration
CompressionConfig config = new CompressionConfig(CompressionType.LOSSY);
config.setOutputPath("/path/to/output.mp4");

// Create compressor
VideoCompressor compressor = new VideoCompressorImpl();

// Compress from file path
CompressionResult result = compressor.compress("/path/to/input.avi", config);

if (result.isSuccess()) {
    System.out.println("Compression successful!");
    System.out.println("Output: " + result.getOutputPath());
    System.out.println("Compression ratio: " + result.getCompressionRatio());
}
```

## Project Structure

```
java-video-compression/
├── docs/                           # Documentation
│   ├── requirements.md
│   ├── technical-design.md
│   └── low-level-design.md
├── diagrams/                       # Design diagrams
│   ├── *.puml                     # PlantUML source files
│   └── *.png                      # Generated diagram images
├── src/                           # Source code (to be implemented)
└── README.md
```

## Development

This project is currently in the design phase. Implementation will follow the specifications outlined in the documentation.

## License

[Add your license information here]
