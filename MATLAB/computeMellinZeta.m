%%%
%%%  compute mellin transformed zeta function  %%%%%%%%%%%%%

%%%%parameters%%%
%% sm is the list of s values for the Mellin %%%%
%% s is the value of s parameter of the zeta function %%%%

function zVal = computeMellinZeta(sm,s,direc,imagetype, thres, rup, rdown)
    zVal= [];                                            %matrix  whose columns are zeta function of each graph for specific value of s parameter of Mellin
    cc=1;                                                % counter
    for i = 0 : 5: 80                                    %iterate over views from 0 to 80
        img = imread(strcat(direc,num2str(i),imagetype));% read image whose directory is given by direc, vienumber and image type
        im=rgb2gray(img); 
        % read image as gray scale
        [cim,r,c]= harris4(im,1,thres,2);                % compute harris corner points for a given threshold 
        cod = [c(:), r(:)];                              % vectors of x and y coordinates of corner points
        
        cod = cod(rup:end,:);                            %discard corner points at the extremes used the rup,
        cod = cod(1:end-rdown,:);                        % and rdown parameters as manually obtained for each image
        
        tri = delaunay(cod(:,1),cod(:,2));               % Delaunay triangulation on the new corners afrter removal of extremes 
        
        g = digraph(tri, tri(:, [2 3 1]));               % form Delaunay graph
        A = adjacency(g);
        A = sparse(A | A');
        G = graph(A);
        
        zValExp = [];
        smIndex = 1;  
        for smm = sm
            Lm = computeMellin(G,smm);                    %compute the Mellin tranformed Laplacian of graph given the s variable of the mellin          

            eg = transpose(eig(full(Lm)));                %column vector of eigenvalues of Laplacian
            zSum= 0;
           
            if s==1                                       % compute zeta function for a given exponent s                                       
                for k = 2 : length(eg)
                    zSum = zSum+ 1.0/(eg(:,k));
                end
            end
            if s>1
               for k = 2 : length(eg)
                    zSum = zSum+ 1.0/(eg(:,k)^s);
               end
            end
            zValExp(smIndex,:) = zSum;                     %append zeta value for a given s to row vector
            smIndex = smIndex+1;
        end
        zVal(:,cc) = zValExp;                              % append the zeta value column vectors for different s values to the overall matrix
        cc = cc+1;
    end
end

