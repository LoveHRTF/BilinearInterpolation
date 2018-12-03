% File Name     : bilinearInterpolation.m
% Author        : Ziwei Chen
% Date          : Dec-02-2018
% Modified      : N/A
% Date          : N/A
% Version       : 1.0
% Description   : This class was designed fo performing bilinear interpolation

classdef bilinearInterpolation
    
    properties
        colorImageMat
        initialRow
        initialCol
        upSampleMat
        upSampleRow
        upSampleCol
        filterMaskMat
        interpolatedImage
    end
    
    methods
        % Constructor for reading input image matrix
        function obj = BilinearInterpolation(imageMatrix) 
            obj.colorImageMat = imageMatrix;
            matSize = size(obj.colorImageMat);
            obj.initialRow = matSize(1);
            obj.initialCol = matSize(2);
        end
        
        % Interpolation Clacluation
        function obj = enlargeImage(obj)
            obj.upSampleRow = obj.initialRow * 2;
            obj.upSampleCol = obj.initialCol * 2;
            obj.upSampleMat = zeros(obj.upSampleRow, obj.upSampleCol, 3);
            obj.filterMaskMat = [1/4, 1/2, 1/4; 1/2, 1, 1/2; 1/4, 1/2, 1/4];
            
            for indexColor = 1 : 3
                for indexCol = 1 : obj.initialCol
                    for indexRow = 1 : obj.initialRow
                        obj.upSampleMat(indexRow*2,indexCol*2,indexColor) = obj.colorImageMat(indexRow,indexCol,indexColor);
                    end
                end
            end
            
            for indexColor = 1:3
                obj.interpolatedImage(:,:,indexColor) = conv2(obj.upSampleMat(:,:,indexColor) , obj.filterMaskMat, 'same');
            end
            
        end
        
        % Save result
        function obj = saveResult(obj)
            obj.interpolatedImage = uint8(obj.interpolatedImage);
            imwrite(obj.interpolatedImage,'result.png');
        end
    end
end

