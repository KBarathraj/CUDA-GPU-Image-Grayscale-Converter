#include <opencv2/opencv.hpp>
#include <cuda_runtime.h>
#include <iostream>
#include <filesystem>

using namespace cv;
using namespace std;
namespace fs = std::filesystem;

__global__ void rgbToGray(unsigned char* input, unsigned char* output, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height)
    {
        int idx = (y * width + x) * 3;

        unsigned char b = input[idx];
        unsigned char g = input[idx + 1];
        unsigned char r = input[idx + 2];

        output[y * width + x] =
            0.114f * b + 0.587f * g + 0.299f * r;
    }
}

void processImage(string inputPath, string outputPath)
{
    Mat image = imread(inputPath);

    if (image.empty())
    {
        cout << "Cannot load image\n";
        return;
    }

    int width = image.cols;
    int height = image.rows;

    size_t inputSize = width * height * 3;
    size_t outputSize = width * height;

    unsigned char* d_input;
    unsigned char* d_output;

    cudaMalloc(&d_input, inputSize);
    cudaMalloc(&d_output, outputSize);

    cudaMemcpy(d_input, image.data, inputSize, cudaMemcpyHostToDevice);

    dim3 threads(16,16);
    dim3 blocks((width + 15)/16, (height + 15)/16);

    rgbToGray<<<blocks, threads>>>(d_input, d_output, width, height);

    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        cout << "CUDA Kernel Error: " << cudaGetErrorString(err) << endl;
    }

    Mat gray(height, width, CV_8UC1);

    cudaMemcpy(gray.data, d_output, outputSize, cudaMemcpyDeviceToHost);

    imwrite(outputPath, gray);

    cudaFree(d_input);
    cudaFree(d_output);

    cout << "Processed: " << inputPath << endl;
}

int main()
{
    string inputFolder = "images";
    string outputFolder = "output";

    fs::create_directory(outputFolder);

    for (const auto& file : fs::directory_iterator(inputFolder))
    {
        string inputPath = file.path().string();
        string filename = file.path().filename().string();

        string outputPath = outputFolder + "\\gray_" + filename;

        processImage(inputPath, outputPath);
    }

    cout << "Done!" << endl;

    return 0;
}