

%%
%%%Laplace transform Laplacian Matrix%%%%%%

%%%Arguments of function
%%% 1st: graph G
%%% 2nd: Laplace exponent,lambda

function [LM,d] = computeLaplace(G,lam)
    d = distances(G);                     % compute distance matrix
    [r,c] = size(d);                      % size of matrix
    
    %%iterate over elements of distance matrix %%%
    %%wherever distance is not equal to one, compute weighted distance
    %%using Laplace %%%%%%%
    for i = 1:(r-1)
        for j = (i+1):c
           if d(i,j)~= 1
               val = exp(-lam*d(i,j));
               d(i,j)= val;
               d(j,i)= val;
           end
        end
    end
    LM = diag(sum(d))-d;     % return Laplace based Laplacian
end


