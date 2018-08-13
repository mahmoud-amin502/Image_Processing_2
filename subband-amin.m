function [fin2,fin3,fin5,fin6,g1,g0 ] = Untitled( )
img1=imread('C:\Users\Amin\Documents\MATLAB\a.jpg');
img1=rgb2gray(img1);
img1=imresize(img1,[512 512]);
% img1=imread('cameraman.tif');


% g0=[0.23037781,0.71484657,0.63088076,-0.02798376,-0.18703481,0.03084138,0.03288301,-0.01059740];

% %%%%%%%%%%%%%%%%h0,h1,g1%%%%%%%%%%%
%
% for i=1:8
%     n=i-1;
%     g1(i)=(((-1)^i)*g0(k-n));
%
% end
% % for i1=1:8
% %     n1=i1-1;
% %     h0(i1)=g0(k-n1);
% % end
%
% for i2=1:8
%     n2=i2-1;
%     h1(i2)=g1(k-n2);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[h0,h1]=HaarTrans;
g0=fliplr(h0);
g1=fliplr(h1);







for b=1:2
    if(b==1)
        img=img1;
    elseif(b>1)
        img=fin2';
    end
    
    fin1=[];
    fin2=[];
    fin3=[];
    fin4=[];
    fin5=[];
    fin6=[];
    
    sz=size(img);
    m=sz(1);
    n1=sz(2);
    
    
    for i=1:m
        temp1=img(i,:);
        temp2=conv2(temp1,h0,'same');
        fin1=[fin1;temp2];
    end
    fin1=downsample(fin1,2);
    
    
    for j=1:n1
        tem1=fin1(:,j);
        tem2=conv2(tem1,h0','same');
        fin2=[fin2 tem2];
        
    end
    fin2=downsample(fin2',2);
    
    for i1=1:n1
        te1=fin1(:,i1);
        te2=conv2(te1,h1','same');
        fin3=[fin3 te2];
    end
    fin3=downsample(fin3',2);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    for j1=1:m
        t1=img(j1,:);
        t2=conv2(t1,h1,'same');
        fin4=[fin4;t2];
    end
    fin4=downsample(fin4,2);
    
    for i2=1:n1
        tt1=fin4(:,i2);
        tt2=conv2(tt1,h0','same');
        fin5=[fin5 tt2];
        
    end
    fin5=downsample(fin5',2);
    
    
    for i3=1:n1
        ttt1=fin4(:,i3);
        ttt2=conv2(ttt1,h1','same');
        fin6=[fin6 ttt2];
        
    end
    fin6=downsample(fin6',2);
    
    
   

    if(b==1)
        copy_fin2=fin2;
        copy_fin3=fin3;
        copy_fin5=fin5;
        copy_fin6=fin6;
    end
    
    %         figure(b);
    %         subplot(3,3,1);
    %         imshow(img);
    %         subplot(3,3,2);
    %         imshow(uint8(fin2'));
    %         subplot(3,3,3);
    %         imshow(uint8(fin3'));
    %         subplot(3,3,4);
    %         imshow(uint8(fin5'));
    %         subplot(3,3,5);
    %         imshow(uint8(fin6'));
    %         subplot(3,3,6);

end

% hello=[];
% for l=1:2    
%     if(l==1)
%         hello=subband_inv(fin2,fin3,fin5,fin6,g1,g0);
%     else
%         hello=subband_inv(copy_fin2,copy_fin3,copy_fin5,copy_fin6,g1,g0);    
%     end   
% end
% 



% imshow(uint8(hello./3.5));

end

