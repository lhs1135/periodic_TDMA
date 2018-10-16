PCR: PCR_Device_Functions.cu PCR_Device_Functions.cuh Test_Main.cu
	nvcc -o PCR PCR_Class.cu PCR_Device_Functions.cu Test_Main.cu

clean:
	rm PCR


# nvcc -o mat_mul mat_mul.cu mat_mul_seq.cu mat_mul_opencl.cu mat_mul_cuda.cu mat_mul_cuda_multi.cu mat_mul_cublas.cu -lOpenCL -I/usr/local/cuda/include -lcublas
