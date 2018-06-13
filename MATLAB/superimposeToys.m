

img = imread(strcat('toys/obj48__',num2str(0),'.png'));
%thr=adjust_thresh(img);
im=rgb2gray(img);
[cim,r,c]= harris1(im,1,70,2);
%[cim,r,c]= harris4(im,1,thr,2);
% Delaunay triangulation
%tri = delaunay(c,r);
cod = [c(:), r(:)];
cod = cod(4:end,:);
cod = cod(1:end-4,:);
imshow(im);
hold on;
dt = DelaunayTri(cod(:,1),cod(:,2));
triplot(dt);
