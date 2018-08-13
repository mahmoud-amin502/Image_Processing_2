function [ output_args ] = Untitled( input_args )
img=imread('C:\Users\MRM\Documents\MATLAB\Image_2\pic1.png');
img=imresize(img,[256,256]);
% imshow(img);
img1=roipoly(img);
% imshow(img1);
r1=img(:,:,1);
g1=img(:,:,2);
b1=img(:,:,3);

r2=r1.*uint8(img1);
g2=g1.*uint8(img1);
b2=b1.*uint8(img1);

%%%%%%%%%%%%%%%%%%%% getting RED average %%%%%%%%%%%%%%%%%%%%%
[index_r1,index_r2]=find(r2);
index_r1=index_r1';
index_r2=index_r2';
szz_r=size(index_r1);
sum_r=0;
for i=1:szz_r(2)  
    indi1=index_r2(:,i);
    indi2=index_r1(:,i);
    ti=r2(indi2,indi1);
    sum_r=sum_r+double(ti);  
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% getting GREEN average %%%%%%%%%%%%%%%%%%%%%
[index_g1,index_g2]=find(g2);
index_g1=index_g1';
index_g2=index_g2';
szz_g=size(index_g1);
sum_g=0;
for i=1:szz_g(2)  
    indi1=index_g2(:,i);
    indi2=index_g1(:,i);
    ti=g2(indi2,indi1);
    sum_g=sum_g+double(ti); 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% getting BLUE average %%%%%%%%%%%%%%%%%%%%%
[index_b1,index_b2]=find(b2);
index_b1=index_b1';
index_b2=index_b2';
szz_b=size(index_b1);
sum_b=0;
for i=1:szz_b(2)    
    indi1=index_b2(:,i);
    indi2=index_b1(:,i);
    ti=b2(indi2,indi1);
    sum_b=sum_b+double(ti);   
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

red_avg=round(sum_r/szz_r(2));
green_avg=round(sum_g/szz_g(2));
blue_avg=round(sum_b/szz_b(2));

sz=size(img1);
th=80;
img1=cat(3,r2,g2,b2);
temp_img=img;


%%%%%%%%%%%%%%%%%%%%%%%%% red component %%%%%%%%%%%%%%%%
temp2=r1;
temp3=[];
for i=1:size(temp2,1)
    for j=1:size(temp2,2)
        temo=double(temp2(j,i));                    %  (j) for the rows ....... (i) for the columns 
        dis=sqrt((red_avg-temo)^2);
        if(dis<=th) 
            temp3(j,i)=1;
        elseif (dis>th)
            temp3(j,i)=0;
        end   
    end   
end
% imshow(temp3);


%%%%%%%%%%%%%%%%%%%%%%% green component %%%%%%%%%%%%%%%%%%%%%%
temp4=g1;
temp5=[];
for i=1:size(temp4,1)
    for j=1:size(temp4,2)
        temo=temp4(j,i);
        temo=double(temo);
        dis1=sqrt((green_avg-temo)^2);
        if(dis1<=th)
            temp5(j,i)=1;
        elseif (dis1>th)
            temp5(j,i)=0; 
        end    
   end   
end
% imshow(temp5);


%%%%%%%%%%%%%%%%%%%%%%%%%%% blue component %%%%%%%%%%%%%%%%%%%%5
temp6=b1;
temp7=[];
for i=1:size(temp6,1)
    for j=1:size(temp6,2)  
        temo=temp6(j,i);
        temo=double(temo);      
       dis2=sqrt((blue_avg-temo)^2);
        if(dis2<=th)            
            temp7(j,i)=1;
        elseif (dis2>th)
            temp7(j,i)=0;           
        end     
    end   
end
% imshow(temp7);


temp3=uint8(temp3);
temp5=uint8(temp5);
temp7=uint8(temp7);

temp3=r1.*temp3;
temp5=g1.*temp5;
temp7=b1.*temp7;

% imshow(temp3);
% imshow(temp5);
% imshow(temp7);

img3=temp3.*temp5;
img3=img3.*temp7;
imshow(img3);
% img3=cat(3,temp3,temp7,temp5);
% imshow(img3);
% imshow(double(img3));

end

