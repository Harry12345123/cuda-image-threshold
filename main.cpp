#include <opencv2/opencv.hpp>
#include <iostream>
void threshold_cuda(const unsigned char *gray_in, unsigned char *gray_out, int width, int height, unsigned char thresh);

int main(int argc, char **argv)
{
    std ::string input = argc > 1 ? argv[1] : "input.jpg";
    cv::Mat img = cv::imread(input, cv::IMREAD_GRAYSCALE);
    if (img.empty())
    {
        std::cerr << "Failed to load image: " << input << std::endl;
        return -1;
    }
    cv::Mat out(img.rows, img.cols, CV_8UC1);
    threshold_cuda(img.data, out.data, img.cols, img.rows, 128);
    cv::imwrite("output_threshold.jpg", out);
    std::cout << "Saved: output_threshold.jpg" << std::endl;
    return 0;
}