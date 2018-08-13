function [] = ImagePyramid()

img=imread('cameraman.tif');
filter_img=img;

for i=1:3
    
    temp=filter_img;
    figure(1)
    subplot(1,3,i);
    imshow(temp);
    
    filter_img=imgaussfilt(filter_img);
    DS_img1=downsample(filter_img,2);
    DS_img1=DS_img1';
    DS_img=downsample(DS_img1,2);
    filter_img=DS_img';

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
    fimg=filter_img;
    
%     sz=size(fimg);
    
    fimg=upsample(fimg,2);
    fimg=fimg';
    fimg=upsample(fimg,2);
    fimg=fimg';
    
    %bilinear interpolation function
  
    error=fimg-temp;
    
    figure(2)
    subplot(1,3,i);
    imshow(error);
    

end





end

