                                        

%% compute normalised Laplacian Matrix %%%%%
function L = computeNormalisedLap(A)               % Adjacency matrix, A, as parameter
    % calculate degree matrix
    degs = sum(A, 2);
    D    = sparse(1:size(A, 1), 1:size(A, 2), degs);

    % compute unnormalized Laplacian
    L = D - A;
        
    % avoid dividing by zero
    degs(degs == 0) = eps;
    
    % calculate D^(-1/2)
    D = spdiags(1./(degs.^0.5), 0, size(D, 1), size(D, 2));

    % calculate normalized Laplacian
    L = D * L * D;
end
