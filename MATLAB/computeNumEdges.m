function egMat = computeNumEdges(direc,imagetype, thres, rup, rdown)
    
    %slen = length(s);                                     %length of zeta argument list
    numview = (0:5:355);                                  % list of views of images
    egMat = zeros(1,length(numview));                  % initialise matrix to contain feature vectors  
    cc=1;      
    
    for i = numview
        img = imread(strcat(direc,num2str(i),imagetype));   % read image
        im=rgb2gray(img);                                   % change gray scale
        
        [cim,r,c]= harris4(im,1,thres,2);                   % find corner points, maximum is thres
        
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
        
        %Extract graph
        G = graph(A);
        
        %compute number of edges
        n = numedges(G);
        
        %append result to matrix
        egMat(:,cc) = n;
        cc = cc+1;
    end
end