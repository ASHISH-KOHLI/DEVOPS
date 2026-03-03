#!/bin/bash

IMAGE_FILE="images_only.txt"
OUTPUT_DIR="deployment-image"

mkdir -p "$OUTPUT_DIR"

while read -r image; do
    # Skip empty lines
    [ -z "$image" ] && continue

    echo " Pulling $image"
    docker pull "$image" || {
        echo " Failed to pull $image"
        continue
    }

    # Convert image name to safe filename
    safe_name=$(echo "$image" | sed 's|/|_|g; s|:|_|g')

    echo " Saving $image to $OUTPUT_DIR/$safe_name.tar"
    docker save -o "$OUTPUT_DIR/$safe_name.tar" "$image"

done < "$IMAGE_FILE"

echo " All images processed"
