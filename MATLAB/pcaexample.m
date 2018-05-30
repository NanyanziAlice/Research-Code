
%%%%pca example

a = diag([1 2 3]);
% disp(pca(a));
A = cov(a) ;   % co-variance matrix 
[V,D] = eig(A) ;  % GEt Eigenvalues and Eigenvectors 
Eig = diag(D) ;
[val,idx] = sort(Eig,'descend') ;
PV = Eig(idx)
PC = V(:,idx)
disp(pca(a))