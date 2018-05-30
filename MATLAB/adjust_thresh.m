
function thr=adjust_thresh(img)
    %img=imread('photos_in/022.jpg');
    img=rgb2gray(img);
    % get the width and height of the image, and compute the area
    [w, h]=size(img);
    A=w*h;
    [thr meet]=adjust_thresh1(100, A, img);
    while meet==1
        [thr meet]=adjust_thresh1(thr, A, img);
        %disp(thr);
    end
    
 function [thr meet]=adjust_thresh1(thr, A, img)
% thr is the threshold, eventually adjusted at this step
% A is W*H
% meet is 1 if conditions are met, so we need to continue
% find the row and column coordinates of the Harris Corner Points
[~,r,c]=harris4(img,1,thr,2);
x=[];
x(:,1)=c;
x(:,2)=r;
% find the coordinates of the vertices of the Voronoi diagram,
% as well as which vertices compose the cells of the diagram
[vert,cell]=voronoin(x,{'Qbb','Qz'});
% the number of cells
numcells=length(cell);
% the fraction of the image area
An=A/numcells;
%disp(['An=' num2str(An)]);
% free up some memory
clearvars x r c;
% the sum of all "small" areas 
S=0;
% the maximum
Ac_max=0;
% meet is 1 if one of the conditions is met, and 0 if not
meet=0;
% meet == 1 when:
% * Ac_max >= A/4
% * Ac <= A/numcells^2
% * S >= A/numcells, where S = Sum[Ac | Ac < A/numcells]
% meet == 0, even if above conditions are met, if:
% * numcellss < sqrt(A)/5
for    i=1:numcells
    % number of vertices in cell i
    len=length(cell{i});
    % XY is a matrix of the vertex coordinates
    XY=zeros(2,len);
    for j=1:len
        % the x coordinate of the j'th vertex of cell i
        XY(1,j)=vert(cell{i}(j),1);
        % the y coordinate of the j'th vertex of cell i
        XY(2,j)=vert(cell{i}(j),2);
    end
        % calculate the area of the current cell
    Ac=polyarea(XY(1,:),XY(2,:));
    % if the area contains a vertex at infinity, ignore this cell
    if(isnan(Ac))
        Ac=An;        
    end
    %calculate the maximum
    if Ac>Ac_max
        Ac_max=Ac;
    end
    if(Ac <= A/(numcells*numcells))
        meet=1; 
% if t
    else
        % calculate S
        if(Ac<An)
            S=S+Ac;
            %disp(['S=' num2str(S)]);
        end
    end
end
if(Ac_max >= A/4) || (S >= An) 
    meet=1;
end
if   (numcells<sqrt(A)/5)
    meet=0;
end
if   (meet==1) 
    thr=thr+100;
end