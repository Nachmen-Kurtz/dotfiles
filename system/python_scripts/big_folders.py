#!/usr/bin/env python3

import os
from pathlib import Path


def get_folder_size(folder_path):
    """Calculate the total size of a folder in bytes."""
    total_size = 0
    try:
        for dirpath, dirnames, filenames in os.walk(folder_path, followlinks=False):
            for filename in filenames:
                file_path = os.path.join(dirpath, filename)
                try:
                    total_size += os.path.getsize(file_path)
                except (OSError, PermissionError):
                    continue
            # Include size of directory itself
            total_size += os.path.getsize(dirpath)
    except (OSError, PermissionError):
        return -1  # Return -1 if we can't access the folder
    return total_size


def format_size(size_bytes):
    """Convert bytes to human-readable format."""
    size_gb = size_bytes / (1024**3)  # Convert to GB
    return f"{size_gb:.2f} GB"


def find_large_folders(start_path, size_threshold_gb=5):
    """Find all folders larger than the specified size in GB."""
    threshold_bytes = size_threshold_gb * (1024**3)  # Convert GB to bytes
    large_folders = []

    # Convert to absolute path and ensure it's a directory
    start_path = os.path.abspath(start_path)
    if not os.path.isdir(start_path):
        print(f"Error: {start_path} is not a directory")
        return

    print(f"Scanning {start_path} for folders larger than {size_threshold_gb} GB...")

    # Walk through directory tree
    for dirpath, dirnames, _ in os.walk(start_path, followlinks=False):
        folder_size = get_folder_size(dirpath)
        if folder_size == -1:
            print(
                f"Warning: Could not access {dirpath} - permission denied or error occurred"
            )
            continue
        if folder_size > threshold_bytes:
            large_folders.append((dirpath, folder_size))

    # Sort by size (largest first)
    large_folders.sort(key=lambda x: x[1], reverse=True)

    # Print results
    if large_folders:
        print(
            f"\nFound {len(large_folders)} folders larger than {size_threshold_gb} GB:"
        )
        for folder, size in large_folders:
            print(f"{format_size(size)} - {folder}")
    else:
        print(f"\nNo folders larger than {size_threshold_gb} GB found.")


def main():
    # Start from user's home directory
    home_dir = str(Path.home())
    try:
        find_large_folders(home_dir)
    except KeyboardInterrupt:
        print("\nScan interrupted by user")
    except Exception as e:
        print(f"An error occurred: {str(e)}")


if __name__ == "__main__":
    main()
