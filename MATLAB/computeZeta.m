%img = imread('./cups/cup.png');
%Seq = loadImages('cups/', '*.png');
function zVal = computeZeta(s,direc,imagetype, thres, rup, rdown)
    numview = (0:5:355);
    zVal = zeros(s,length(numview));
    cc=1;
    for i = numview
        img = imread(strcat(direc,num2str(i),imagetype));
        %thr=adjust_thresh(img);
        im=rgb2gray(img);
        [cim,r,c]= harris4(im,1,thres,2);
        %discard corner points at the extremes
        cod = [c(:), r(:)];
        cod = cod(rup:end,:);
        cod = cod(1:end-rdown,:);
        % Delaunay triangulation
        tri = delaunay(cod(:,1),cod(:,2));
        %create graph from delanauy, compute adjacency and Laplacian
        %matrices
        g = digraph(tri, tri(:, [2 3 1]));
        A = adjacency(g);
        A = sparse(A | A');
        L = diag(sum(A))-A;    
        %column vector of eigenvalues of Laplacian
        eg = sort(eig(full(L)));
        eg = eg(2:end,:);
        zSum= sum(eg.^(-s));
        zVal(cc,:) = zSum;
        cc = cc+1;
    end
end