#!/bin/bash

# Define the directory containing the MIDI files
midi_directory="dataset"

# Iterate over all MIDI files in the directory
for midi_file in "$midi_directory"/*.mid; do
    # Check if the file is a regular file
    if [ -f "$midi_file" ]; then
        # Run the Python script for each MIDI file
        python3 midi2video.py -i "$midi_file"
    fi
done