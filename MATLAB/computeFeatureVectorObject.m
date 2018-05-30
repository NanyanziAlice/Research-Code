
%%%%%%%%%function to compute feature vector of leading coefficient of heat content
            %%%%%%%%%polynomial (Laplacian)%%%%
%%%% Arguments of the function %%%%%
%%% 1st: list of coefficient index 
%%% 2nd: directory of images
%%% 3rd: image type
%%% 4th: number of points/vertices of Delanay graph
%%% 5th&6th: cordinates of the extreme corner points to be deleted 


function egMat = computeFeatureVectorObject(coeffList,direc,imagetype, thres, rup, rdown)
    numview = (0:5:355);                                   % list of view angles
    egMat = zeros(length(coeffList),length(numview));      % initialise matrix to contain feature vectors
    cc=1;                                                  % initialise column index
    
    
    for i = numview                                         % iterate over the different views of an object
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
        L = diag(sum(A))-A;
        
        % compute the polynomial coefficients 
        bk = createPolynomialFeatureVector(full(L), coeffList);
        
        %append computed coefficients as column of the matrix
        egMat(:,cc) = bk;
        cc = cc+1;
    end
end