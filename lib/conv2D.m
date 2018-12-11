% File Name: conv2D.m
% Author   : Ziwei Chen
% Date     : Dec-10-2018
% Modified : N/A
% Date     : N/A
% Version  : Ver. 1.0
% Descrip  : This function was a replacement for built-in conv2()
%%
function [resultVector] = conv2D(targetMat,maskMat)
%% Get input parameter
inputSize = size(targetMat);
maskSize = size(maskMat);
maskOffset = floor(maskSize./2);
isEven = int32(not(rem(maskSize,2)));

%% Patting
tempSize(1) = inputSize(1) + 2 * maskOffset(1);
tempSize(2) = inputSize(2) + 2 * maskOffset(1);
tempResult = ones(tempSize);
tempTarget = ones(tempSize);
tempTarget(maskOffset(1) + 1 : tempSize(1)-maskOffset(1) ,...
    maskOffset(2) + 1 : tempSize(2) - maskOffset(2)) = ...
    targetMat;

%% Perform correlation as a replacement of convolution
for iterRow =  maskOffset(1) + 1 :  tempSize(1) - maskOffset(1)
    for iterCol = maskOffset(2) + 1 :  tempSize(2) - maskOffset(2)
        
         pixVal = tempTarget(iterRow - maskOffset(1) : iterRow + maskOffset(1) + isEven(1),...
            iterCol - maskOffset(2) : iterCol + maskOffset(2) + isEven(2)) .* maskMat;
        
        tempResult(iterRow,iterCol) = sum(pixVal(:));
    end
end

%% Output
resultVector = tempResult(maskOffset(1) + 2 : tempSize(1)-maskOffset(1) ,...
    maskOffset(2) + 2 : tempSize(2) - maskOffset(2));