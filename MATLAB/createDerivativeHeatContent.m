
%%%%%%%%%function to compute leading coefficient of heat content
            %%%%%%%%%polynomial%%%%
%%%% Arguments of the function %%%%%
%%% 1st: Laplacian/Normalised Laplacian whose eigenvalues and vectors 
%%% 2nd: list of coefficient index 



function Bk = createDerivativeHeatContent(L, n)
    %n = length(coeffList);                     %size of coefficient list
    Bk = zeros(n,1);                           % initialising matrix to contain the results
    %[r,c] = size(L);                           % compute rows and columns of the input matrix
    [V,A] = eig(L);                            % compute eigenvalues and corresponding vectors
    [E, iA]=sort(diag(A));                    % sort L in ascending
    %E=diag(A);                                % reform eigenvalue matrix
    V=V(:,iA);                                % reorder eigenvectors
    
    %E = diag(A);                               % form column veector of eigenvalues
    S = sum(V);                                % sum over columns of vector matrix
    SS = S.^2;                                 % square sum of each column
    
    c = 1;                                     % set index to 1
    
    
    %% compute polynomial coefficients  based on the list of index
    
   for k = (2:n+1)                                      % iterate over vertices
       Sum = SS(k) * E(k);                            % compute the sum
       Bk(c,:)= Sum;                                  %column vector of polynomial coefficients of Laplacian
       c = c+1;
    end