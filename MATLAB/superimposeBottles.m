
img = imread(strcat('bottles/obj50__',num2str(0),'.png'));
%thr=adjust_thresh(img);
im=rgb2gray(img);
[cim,r,c]= harris1(im,1,70,2);
% Delaunay triangulation
%tri = delaunay(c,r);
cod = [c(:), r(:)];
n = length(r)
cod = cod(3:end,:);
cod = cod(1:end-3,:);
imshow(im);
hold on;
dt = DelaunayTri(cod(:,1),cod(:,2));
triplot(dt);
