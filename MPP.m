function [ output_args ] = Untitled2( input_args )

img=imread('C:\Users\MRM\Documents\MATLAB\Image_2\Picture1.png');
% img=imresize(img,[500,500]);
ydim=2;
xdim=2;

boundary=bwboundaries(img);
boundary=boundary{1,1};

for i=2:size(boundary(1))
    
    temp=boundary(i,:);
    l1=sqrt(((temp())^2)+(()^2))
    
end






img_size=size(img);
m=img_size(1);
n=img_size(2);
if mod(m,ydim) ~= 0
     m = m + ydim-mod(m,ydim);
     img(m,1)=0;
end
if mod(n,xdim) ~= 0
     n = n + xdim-mod(n,xdim);
     img(1,n)=0;
end
yvec(ydim) = 0;
yvec = yvec + m/ydim;
xvec(xdim) = 0;
xvec = xvec + n/xdim;
blocks = mat2cell(img,yvec,xvec);
c=blocks{1,1};




end

