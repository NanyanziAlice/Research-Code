
function egMat = computeFeatureVector(s,direc,imagetype, thres, rup, rdown)
    egMat = zeros(s,17);
    cc=1;
    for i = 0 : 5: 80
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
        eg = transpose(eig(full(L)));
        eg = eg(end-5:end,:);
        egMat(cc,:) = eg;
        cc = cc+1;
    end
end