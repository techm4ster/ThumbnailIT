#!/bin/bash

# Prompt the user to enter the directory path
echo "Please enter the full path of the video folder:"
read video_folder

# Check if the folder exists
if [ ! -d "$video_folder" ]; then
    echo "Error: Video folder not found at '$video_folder'"
    exit 1
fi

# Loop through all MP4 files in the folder
for video_file in "$video_folder"/*.mp4; do
    # Check if a video file was found
    if [ -f "$video_file" ]; then
        # Extract the base name (filename without extension)
        base_name=$(basename "$video_file" .mp4)

        # Construct the full path to the corresponding thumbnail image with the "-poster" suffix
        thumbnail_image="$video_folder/$base_name-poster.jpg"
        
        # Check if the thumbnail image exists
        if [ -f "$thumbnail_image" ]; then
            # Define the output file name
            output_file="${video_file%.mp4}_with_thumb.mp4"
            
            # Use FFmpeg to embed the thumbnail
            ffmpeg -i "$video_file" -i "$thumbnail_image" -map 0:v -map 0:a? -map 1:v -c copy -c:v:1 mjpeg -disposition:v:1 attached_pic "$output_file"
            
            echo "Added thumbnail from '$base_name-poster.jpg' to '$video_file'. New file saved as '$output_file'"
        else
            echo "Skipping '$video_file': No matching thumbnail image found."
        fi
    fi
done

echo "Script finished."