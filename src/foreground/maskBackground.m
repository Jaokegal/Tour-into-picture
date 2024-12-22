function [foreground, img_FG]= maskBackground(img, pos)
L = superpixels(img,500);
%Splitting an image into 500 superpixels using the superpixels function
x_sp_fore = pos(:, 1);
y_sp_fore = pos(:, 2);
roi = poly2mask(x_sp_fore,y_sp_fore,size(L,1),size(L,2));
%Use the poly2mask function to create a binary mask of the same size as the image, with the foreground area being 1 and the other areas being 0
BW = grabcut(img,L,roi);
% Image segmentation using grabcut algorithm to generate foreground mask BW (value of 1 for foreground and 0 for background) based on supplied superpixels and initial mask roi
foreground = img;
foreground(repmat(~BW,[1 1 3])) = 1;
%Set the background of the image to black, leaving only the foreground.
%Use the repmat function to extend the binary mask BW to 3 channels, matching the size of the original image img
img(repmat(BW,[1 1 3])) = 0;
img_FG = inpaintExemplar(img,BW,'FillOrder','tensor');
%Places the foreground portion of the image in black, leaving only the background portion.
%Use the inpaintExemplar function to repair parts of the background, filling in areas masked by the foreground.
end