We need to create a reusable Java library which will allow the consumer app to compress videos.  
Input can be either the byte array (of the original video) or the file path to the video.  
The file path will be on the local file system.  

You can use ffmpeg for video compression.  
Let us bundle the binary executable for ffmpeg on local.  we will need both windows and linux executables.  
At runtime we need to check which OS we are on, and accordingly use the appropriate ffmpeg binary for video compression.  

when compressing, let us have a configuration object as input to our utility which will indicate if the compression is to be lossy or lossless. Also lets allow max compression as well.  

We need to write some unit tests as well.  
And we need to test with actual video files.  

We need to support most of the common video formats.  

See if we can use multi-threading in some places to make the processing faster.  
Also any other potential optimizatons that we can do to make compression faster.  





