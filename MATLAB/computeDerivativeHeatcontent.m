

%%%%%%%%%functiontocoputefeaturevectorusingderivativeheatcontent%%%%%%%%%%%

function egMat = computeDerivativeHeatcontent(m,direc,imagetype, thres, rup, rdown)
    numview = (0:5:355);
    egMat = zeros(m,length(numview));
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
        Ln = computeNormalisedLap(full(A));
        egvec = createDerivativeHeatContent(full(Ln), m);
        egMat(:,cc) = egvec;
        cc = cc+1;
    end
end