image=imread('logTransformation.jpg');
grayimage=rgb2gray(image);
c=input('Enter the constant value, c = ');
[M,N]=size(grayimage);
        for x = 1:M
            for y = 1:N
                m=double(grayimage(x,y));
                finalImage(x,y)=c.*log10(1+m); 
            end
        end
imshow(image), figure, imshow(finalImage);