NVCC = nvcc
NVCC_FLAGS = -std=c++17 -O3 -gencode arch=compute_86,code=sm_86 -gencode arch=compute_89,code=sm_89 -gencode arch=compute_120,code=sm_120
OPENCV_FLAGS = `pkg-config --cflags --libs opencv4`

TARGET = processImages
SRC = main.cu

all: $(TARGET)

$(TARGET): $(SRC)
	$(NVCC) $(NVCC_FLAGS) $(SRC) -o $(TARGET) $(OPENCV_FLAGS)

clean:
	rm -f $(TARGET)
