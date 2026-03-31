#include <cuda_runtime.h>
__global__ void threshold_kernel(const unsigned char *in, unsigned char *out, int width, int height,
                                 unsigned char thresh)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x >= width || y >= height)
        return;
    int idx = y * width + x;
    out[idx] = (in[idx] > thresh) ? 255 : 0;
}
void threshold_cuda(const unsigned char *gray_in, unsigned char *gray_out, int width, int height,
                    unsigned char thresh)
{
    size_t bytes = width * height;
    unsigned char *d_in = nullptr, *d_out = nullptr;
    cudaMalloc(&d_in, bytes);
    cudaMalloc(&d_out, bytes);
    cudaMemcpy(d_in, gray_in, bytes, cudaMemcpyHostToDevice);
    dim3 block(16, 16);
    dim3 grid((width + 15) / 16, (height + 15) / 16);
    threshold_kernel<<<grid, block>>>(d_in, d_out, width, height, thresh);
    cudaDeviceSynchronize();
    cudaMemcpy(gray_out, d_out, bytes, cudaMemcpyDeviceToHost);
    cudaFree(d_in);
    cudaFree(d_out);
}