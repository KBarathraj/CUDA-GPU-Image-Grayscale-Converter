# CUDA GPU Image Grayscale Converter

## Description

This project uses CUDA GPU programming to convert RGB images into grayscale images using parallel GPU processing.

Each CUDA thread processes one pixel independently.

## Technologies Used

* CUDA
* C++
* OpenCV

## Requirements

* NVIDIA GPU
* CUDA Toolkit
* OpenCV
* Visual Studio

## How to Run

1. Place input images inside the `images/` folder.
2. Build and run the project in Visual Studio.
3. Processed grayscale images will appear inside the `output/` folder.

## GPU Kernel

The CUDA kernel converts RGB pixels to grayscale using:

gray = 0.299*r + 0.587*g + 0.114*b

## Output

The program processes multiple images and saves grayscale outputs automatically.

Sample Input:
<img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/8e9f1335-7763-4d15-805b-d3e3605b57c9" />


Sample Output:
<img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/8ce7ba7b-17a2-4e5f-9463-f62f0742ee29" />
