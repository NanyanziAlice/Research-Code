
img = imread(strcat('container/obj70__',num2str(0),'.png'));
thr=adjust_thresh(img);
im=rgb2gray(img);
[cim,r,c]= harris4(im,1,70,2);
% Delaunay triangulation
%tri = delaunay(c,r);
cod = [c(:), r(:)];
cod = cod(3:end,:);
cod = cod(1:end-5,:);
imshow(im);
hold on;
dt = DelaunayTri(cod(:,1),cod(:,2));
triplot(dt);
