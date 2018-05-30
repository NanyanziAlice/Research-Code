
function featVec= computeSymmetricPoly(vector)
    n = length(vector);
    featVec = zeros(n,1);
    for k = 1:n
        e = sum(prod(nchoosek(vector,k),2));
        featVec(k,:)=e;
    end
        

end