
%superimpose delanauy graph onto the toys onto the image%

img = imread(strcat('toys/obj48__',num2str(0),'.png'));  %read the image by specifying the name and view number
im=rgb2gray(img);                                        %change the read image to gray scale
[cim,r,c]= harris4(im,1,50,2);                           %Perform Harris corner detection with arguments
                                                         %image matrix, sigma,thresh,radius
cod = [c(:), r(:)];                                      % pairs to form cordinates for each corner point
cod = cod(5:end,:);                                      %eliminate corner points outside the object of interst
cod = cod(1:end-4,:);                                    % that is points in the background
figure(1)        
imshow(im);                                              %show image
hold on;
dt = DelaunayTri(cod(:,1),cod(:,2));                     %perform Delanaunay triangulation on the selected points
triplot(dt);                                             %and superimpose the graph onto the image



