
N = 20;%The number of pixels along a dimension of the image
A = zeros(N, N);%The image
Adj = zeros(N*N, N*N);%The adjacency matrix

%Use 8 neighbors, and fill in the adjacency matrix
dx = [-1, 0, 1, -1, 1, -1, 0, 1];
dy = [-1, -1, -1, 0, 0, 1, 1, 1];
for x = 1:N
   for y = 1:N
       index = (x-1)*N + y;
       for ne = 1:length(dx)
           newx = x + dx(ne);
           newy = y + dy(ne);
           if newx > 0 && newx <= N && newy > 0 && newy <= N
               index2 = (newx-1)*N + newy;
               Adj(index, index2) = 1;
           end
       end
   end
end



%load vvv.mat
%VV

%%%BELOW IS THE KEY CODE THAT COMPUTES THE SOLUTION TO THE DIFFERENTIAL
%%%EQUATION
Deg = diag(sum(Adj, 2));%Compute the degree matrix
L = Deg - Adj;%Compute the laplacian matrix in terms of the degree and adjacency matrices
[V, D] = eig(L);%Compute the eigenvalues/vectors of the laplacian matrix
D = diag(D);

%Initial condition (place a few large positive values around and
%make everything else zero)
C0 = zeros(N, N);
C0(2:5, 2:5) = 5;
C0(10:15, 10:15) = 10;
C0(2:5, 8:13) = 7;
C0 = C0(:);

C0V = V'*C0;%Transform the initial condition into the coordinate system 
%of the eigenvectors

%for t = 0:0.05:5
%Loop through times and decay each initial component
   %Phi = C0V.*exp(-D*t);%Exponential decay for each component
   %Phi = V*Phi;%Transform from eigenvector coordinate system to original coordinate system
   %Phi = reshape(Phi, N, N);
   %Display the results and write to GIF file
   %imagesc(Phi);
   %caxis([0, 10]);
   %title(sprintf('Diffusion t = %1d', t*100));
 %end
%save('vfile.mat','V','-v7')


t = 3.0;
Phi = C0V.*exp(-D*t);%Exponential decay for each component
Phi = V*Phi;%Transform from eigenvector coordinate system to original coordinate system
Phi = reshape(Phi, N, N);
imagesc(Phi);
%caxis([0, 10]);
%imshow(img);
%Phi




