clearvars;
clc;
it= imread('logTransformation.jpg');   %read the image
itemp = it(:,:,1);
[r,c]= size(itemp);         % get the dimensions of image
s = zeros(r,c,8);           % pre allocate a variable to store 8 bit planes of the image
for k = 1:8
    for i = 1:r
        for j = 1:c
            s(i,j,k) = bitget(itemp(i,j),k);    %get kth bit from each pixel 
        end
     end
    
end
figure,imshow(uint8(itemp));title('Original Image');    %display original image
figure;                                                 %display all the 8 bit planes
    subplot(3,3,1);imshow(s(:,:,8));title('8th(MSB)Plane');
    subplot(3,3,2);imshow(s(:,:,7));title('7th Plane');
    subplot(3,3,3);imshow(s(:,:,6));title('6th Plane');
    subplot(3,3,4);imshow(s(:,:,5));title('5th Plane');
    subplot(3,3,5);imshow(s(:,:,4));title('4th Plane');
    subplot(3,3,6);imshow(s(:,:,3));title('3th Plane');
    subplot(3,3,7);imshow(s(:,:,2));title('2nd Plane');
    subplot(3,3,8);imshow(s(:,:,1));title('1st(LSB)Plane')
    % reconstruct the original image from generated bit planes
    rec=s(:,:,1)+s(:,:,2)*2+s(:,:,3)*4+s(:,:,4)*8+s(:,:,5)*16+s(:,:,6)*32+s(:,:,7)*64+s(:,:,8)*128; 
    subplot(3,3,9);imshow(uint8(rec));title('Recovered Image')%display the reconstructed image