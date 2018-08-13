function [] = subBand () 
clc 

image=imread('Cameraman.tif') ;  
figure(1) ; 
subplot(3 , 3 , 1 ) ; 
imshow(image) ; 
title('Orignal image') ; 



g0=[0.23037781 0.71484657 0.63088076 -0.02798376 -0.18703481 0.03084138 0.03288301 -0.01059740];
g1=[];
h0=[];
h1=[];
k=8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%g1
n=0;
for i=1:8 
g(i)= ((-1)^n)*(g0(k-n));
g1=[g1 g(i)]
n=n+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%h0
n1=0;
for j=1:8 
h(j)=g0(k-n1);
h0=[h0 h(j)];
n1=n1+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%h1
n2=0;
for j=1:8 
hh(j)=g1(k-n2);
h1=[h1 hh(j)];
n2=n2+1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[R C]=size(image) ; 
%is the approximation part 
RLimage=[] ; 
for i=1:R 
   ro=conv2(image(i,:) ,h0 , 'same') ;
   RLimage=[RLimage ; ro];
end

downimageR=dyaddown(RLimage , 'r' , 2) ;

[a b]=size(downimageR) ; 

CLimage=[] ; 
for i=1:C 
   col=conv2(downimageR(:,i) ,h0' , 'same') ;
   CLimage=[CLimage  col];
end

downimageC =dyaddown(CLimage , 'c' , 2) ;

[q w]=size(downimageC) ;

subplot(3,3,2) ; 
imshow(uint8(downimageC)) ;
title('approximation  image') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%] is vertical detail part 

    CHimage=[] ; 
for i=1:C 
   col=conv2(downimageR(:,i) ,h1' , 'same') ;
   CHimage=[CHimage  col];
end

downimageCC =dyaddown(CHimage , 'c' , 2) ;
subplot(3,3,3) ; 
imshow(uint8(downimageCC)) ;
title('vertical detail  image') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 %horizontal detail part 
  RHimage=[] ;
    for i=1:R 
   ro=conv2(image(i,:) ,h1 , 'same') ;
   RHimage=[RHimage ; ro];
    end

   highdownimageR=dyaddown(RHimage , 'r' , 2) ;
    
   dital=[] ;
   for i=1:C 
   col=conv2(highdownimageR(:,i) ,h0' , 'same') ;
   dital=[dital  col];
end
   
   
   dital =dyaddown(dital , 'c' , 2) ;
subplot(3,3,4) ; 
imshow(uint8(dital)) ;
title('horizontal detail  image') ;
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

   % diagonal detail 
   
      diagonal=[] ;
   for i=1:C 
   col=conv2(highdownimageR(:,i) ,h1' , 'same') ;
   diagonal=[diagonal  col];
end
   
   
   diagonal =dyaddown(diagonal , 'c' , 2) ;
subplot(3,3,6) ; 
imshow(uint8(diagonal)) ;
title('diagonal detail  image') ;

