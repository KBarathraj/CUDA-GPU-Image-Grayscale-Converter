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
2. **Windows**: Run `build.bat` in your terminal or double-click it. This will automatically set up the MSVC compiler, link OpenCV, and build `processImages.exe`. Run the executable using `.\processImages.exe`.
3. **Linux / Unix**: Run `./run.sh` or use `make` to compile and execute the program automatically using the provided Makefile.
4. Processed grayscale images will automatically appear inside the `output/` folder with a `gray_` prefix.

## GPU Kernel

The CUDA kernel converts RGB pixels to grayscale using:

gray = 0.299*r + 0.587*g + 0.114*b

## Output

The program processes multiple images and saves grayscale outputs automatically.

Sample Input:
<img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/8e9f1335-7763-4d15-805b-d3e3605b57c9" />


Sample Output:
<img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/8ce7ba7b-17a2-4e5f-9463-f62f0742ee29" />
