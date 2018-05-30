
%%%%Harris corner point detection%%%%%%%%

function[cim,r,c]= harris1(im,sigma,thresh,radius)
    error(nargchk(2,5,nargin));                            % validate the number of   input arguments   
    dx = [-1 0 1;   -1 0 1;   -1 0 1];                     % special matrix for convolution
    dy = dx';                                              % the transpose of dx, also used for convolution
    Ix = conv2(single(im), single(dx), 'same');            %Compute the x and y derivatives of the image, 
    Iy = conv2(single(im), single(dy), 'same');            %Ix and Iy 
    
    
    g = fspecial('gaussian',max(1,fix(6*sigma)), sigma);   % Gaussian filter
    
    Ix2 = conv2(single(Ix.^2), single(g), 'same');         %Compute the products of derivatives at every pixel: 
    Iy2 = conv2(single(Iy.^2), single(g), 'same');         %Ix^2, Iy^2, IxIy
    Ixy = conv2(single(Ix.*Iy), single(g), 'same');        
    cim = (Ix2.*Iy2 - Ixy.^2)./(Ix2 + Iy2    + eps);       %cim is the determinant/trace
%     k = 0.04; 
%     cim = (Ix2.*Iy2 - Ixy.^2) - k*(Ix2 + Iy2).^2; 
    
    if nargin > 2                                          %Threshold on   cim
        sze = 2*radius+1;                 
        mx = ordfilt2(cim,sze^2,ones(sze));
    
        cim = (cim==mx)&(cim>thresh);                      %Find local maxima
        [r,c] = find(cim); 
        
    end