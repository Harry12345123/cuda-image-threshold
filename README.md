# CUDA Image Threshold

A simple CUDA C++ project for image thresholding and binary segmentation on the GPU.

This repository is built for developers who want to learn how pixel-wise operations can be accelerated with CUDA.

## Features

- image thresholding with CUDA
- binary image generation
- simple and clean C++ structure
- beginner-friendly GPU kernel example

## Tech Stack

- C++
- CUDA
- OpenCV

## Project Goal

This project demonstrates:

- pixel-level parallel processing with CUDA
- basic GPU image segmentation logic
- practical CUDA kernel design for image tasks

## Future Improvements

- adaptive threshold
- dynamic threshold parameters
- real-time video thresholding
- Jetson deployment

## Related Topics

CUDA, Thresholding, Image Segmentation, GPU Computing, C++, OpenCV

## Author

Harry12345123

## More

This repository is one of the foundational CUDA image processing demos in my GitHub project series.


## Requirements
Before building this project, make sure your system has:

- CUDA Toolkit
- OpenCV
- CMake 3.18 or later
- C++17 compatible compiler

## Build
Use the following commands to compile the project:

```bash
mkdir build
cd build
cmake ..
make -j

## Run
After building, run the program with:

./cuda_image_threshold ./input.jpg



