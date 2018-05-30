%%
%%%Mellin transform Laplacian Matrix%%%%

%%%Arguments of function
%%% 1st: graph G
%%% 2nd: Mellin exponent s

function [LM, d] = computeMellin(G,s)
    d = distances(G);                     % compute distance matrix
    [r,c] = size(d);                      % size of matrix
    
    %%iterate over elements of distance matrix %%%
    %%wherever distance is not equal to one, compute weighted distance
    %%using Mellin %%%%%%%
    for i = 1:(r-1)
        for j = (i+1):c
           if d(i,j)~= 1
               val = d(i,j)^(-s);
               d(i,j)= val;
               d(j,i)= val;
           end
        end
    end
    LM = diag(sum(d))-d;             % return Mellin based Laplacian
end


