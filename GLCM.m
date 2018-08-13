function GLCM

clc;

image1=imread('Random.bmp');

image2=imread('Periodic.bmp');

image3=imread('Mixed.bmp');

[R C]=size(image1); %%%%% 263*800

glcm1 = graycomatrix(image1);
glcm2 = graycomatrix(image2);
glcm3 = graycomatrix(image3);

g1=[];
g2=[];
g3=[];

Sum1=sum(sum(glcm1));
for i=1:8
    for j=1:8
        g1(i,j)=(glcm1(i,j)/Sum1);
    end
end
Sum2=sum(sum(glcm2));
for i=1:8
    for j=1:8
        g2(i,j)=(glcm2(i,j)/Sum2);
    end
end
Sum3=sum(sum(glcm3));
for i=1:8
    for j=1:8
        g3(i,j)=(glcm3(i,j)/Sum3);
    end
end


Probability1 = max(max(g1))
Test1GLCM = graycoprops(glcm1,'Correlation','Contrast','Homogeneity');
Entropy1 = entropy(image1)
uniformaty1 = sum(sum(sqrt(g1)))

Probability2 = max(max(g2))
Test2GLCM = graycoprops(glcm2,'Correlation','Contrast','Homogeneity');
Entropy2 = entropy(image2)
uniformaty2 = sum(sum(sqrt(g2)))

Probability3 = max(max(g3))
Test3GLCM = graycoprops(glcm3,'Correlation','Contrast','Homogeneity');
Entropy3 = entropy(image3)
uniformaty3 = sum(sum(sqrt(g3)))

end

