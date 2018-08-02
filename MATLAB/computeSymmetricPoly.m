
function featVec= computeSymmetricPoly(vector)
    n = length(vector);
    featVec = zeros(6,1);
    i=1;
    for k = [1,2,3,n-2,n-1,n]
        e = sum(prod(nchoosek(vector,k),2));
        featVec(i,:)=e;
        i=i+1;
    end
    %featVec([1 2 3 end-2 end-1 end]);   

end