
%%%%%%%%%function to compute feature vector of zeta function
            %%%%%%%%%(Mellin based Normalised Laplacian)%%%%
            
%%%% Arguments of the function %%%%%
%%% 1st: Mellin exponents, s
%%% 2nd: list of zeta arguments 
%%% 3rd: directory of images
%%% 4th: image type
%%% 5th: number of points/vertices of Delanay graph
%%% 6th&7th: cordinates of the extreme corner points to be deleted  


function egMat = computeFeatureVectorZetaMellin(smellin,s,direc,imagetype, thres, rup, rdown)

    slen = length(s);                                     %length of zeta argument list
    numview = (0:5:355);                                  % list of views of images
    egMat = zeros(slen,length(numview));                  % initialise matrix to contain feature vectors  
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
        
        %compute Mellin based Laplacian and Adjacency
        [L,A] = computeMellin(G,smellin);
        
        %compute Normalised Mellin Laplacian
        Ln = computeNormalisedLap(full(A));
        
        %column vector of eigenvalues of Normalised Laplacian
        eg = sort(eig(Ln));                        % sort in non-decresing order
        eg = eg(2:end,:);                          %eliminate the zero eigenvalue
        
        egvec = zeros(1,slen);                     %initialise row vector to capture computed zeta values
        ct = 1;                                    % set column index
        
        %compute zeta functions
        for ss = s
            egsum = sum(eg.^(-ss));
            egvec(ct,:) = egsum;
            ct = ct+1;
        end
        
        %append result to matrix
        egMat(:,cc) = egvec;
        % egMat(:,cc) = eg;
        cc = cc+1;
    end
end