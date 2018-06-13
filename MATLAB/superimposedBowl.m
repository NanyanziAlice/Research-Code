%toys/obj48__
%bowls/obj25__
img = imread(strcat('bowls/obj25__',num2str(0),'.png'));
%thr=adjust_thresh(img);
im=rgb2gray(img);
[cim,r,c]= harris1(im,1,30,2);
% Delaunay triangulation
%tri = delaunay(c,r);
cod = [c(:), r(:)];
cod = cod(3:end-3,:);
cod = cod(1:end-1,:);
n = length(r);
%5gcxcod  = cod(cod(:,1)==1 | cod(:,2)==1,:);
%cod  = cod(cod(:,1)< n,:);
imshow(im);
hold on;
dt = delaunayTriangulation(cod(:,1),cod(:,2));
triplot(dt);



