% File Name     : bilinearInterpolation_Script.m
% Author        : Ziwei Chen
% Date          : Dec-02-2018
% Modified      : N/A
% Date          : N/A
% Version       : 1.0
% Description   : This script is to test the bilinearInterpolation class

imgObj = BilinearInterpolation(imread('exampleImage.jpg'));
imgObj = imgObj.enlargeImage;
imgObj.saveResult;