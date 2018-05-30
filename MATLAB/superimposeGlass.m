
img = imread(strcat('glass/obj18__',num2str(135),'.png'));
%thr=adjust_thresh(img);
im=rgb2gray(img);
[cim,r,c]= harris4(im,1,90,2);
% Delaunay triangulation
%tri = delaunay(c,r);
cod = [c(:), r(:)];
length(r)
% cod = cod(4:end,:);
% cod = cod(1:end-3,:);
imshow(im);
hold on;
dt = delaunayTriangulation(cod(:,1),cod(:,2));
%hu = delaunay(cod(:,1),cod(:,2));
triplot(dt);
% g= digraph(hu, hu(:,[2 3 1]));
% A = adjacency(g);
% A = A|A';
% g = graph(A);
%plot(g);

