

I =  imread('cup.png');
corners = detectHarrisFeatures(I);
imshow(I); hold on;
plot(corners.selectStrongest(50));