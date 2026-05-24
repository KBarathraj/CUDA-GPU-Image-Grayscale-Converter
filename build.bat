@echo off
echo ==============================================
echo Building CUDA OpenCV Project...
echo ==============================================

:: Setup Visual Studio Environment
call "C:\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

:: Compile main.cu with NVCC
"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v13.2\bin\nvcc.exe" -std=c++17 -gencode arch=compute_86,code=sm_86 -gencode arch=compute_89,code=sm_89 -gencode arch=compute_120,code=sm_120 main.cu -o processImages.exe -I"c:\Users\barat\opencv\build\include" -L"c:\Users\barat\opencv\build\x64\vc16\lib" -lopencv_world4120

if %ERRORLEVEL% == 0 (
    echo.
    echo Build successful! Run processImages.exe to start.
) else (
    echo.
    echo Build failed. Check the errors above.
)
pause
