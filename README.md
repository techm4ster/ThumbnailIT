# ThumbnailIT

SIMPLE BASH SCRIPT TO ADD THUMNAIL IMAGE TO A VIDEO.

Let's say that you downoad alot of videos with its thimbnail in this case the thumbnail has the same name as video just with the "-poster" text after filename;
Example:

  video: Asian Step Daughter Jerk Off Assistant - Kimmy Kimm - Family Therapy - Alex Adams.mp4
  thumb: Asian Step Daughter Jerk Off Assistant - Kimmy Kimm - Family Therapy - Alex Adams-poster.jpg

The key change is how the script constructs the thumbnail filename: It will look for a .jpg file with the same name as the video, but with the additional -poster suffix.

A thumbnail isn't a separate, visible part of the file; it's an embedded image within the video's metadata. 
To add a thumbnail in bulk, you would need to use a tool like FFmpeg, which is a powerful command-line utility for handling multimedia files.

Using FFmpeg for Bulk Thumbnails
FFmpeg is the best tool for this job. It can programmatically loop through all video files in a folder and embed an image as a thumbnail.

Prerequisites
First, you need to install FFmpeg on your system. It is available for Windows, macOS, and Linux. You can find installation instructions on the official FFmpeg website. 
After installation, make sure the ffmpeg command is accessible from your command line or terminal.

Run this script:
The script will go through each video, find its matching poster image, and create a new video file with the thumbnail embedded. It does not overwrite the original files, so you can test it without risk. The new files will have _with_thumb appended to their names.