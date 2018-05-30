%%%%%%plots of leading coefficients function against view number %%%
             %%%for normal laplacian%%%%

% arguments to the computeFeatureVectorObject() function
%first : list of coefficients
%second: directory of image
%third  : image type
%fouth  : number of points/vertices of Delanay graph
%fifth&sixth  : cordinates of the extreme corner points to be deleted  

z_num = (1:72);                                                            % list of view numbers
q = [1,2,3,4];                                                             

zGlass     = computeFeatureVectorObject(q,'glass/obj18__','.png',90,4,3);      
zToy       = computeFeatureVectorObject(q,'toys/obj48__','.png',55,4,4);     
zBowl      = computeFeatureVectorObject(q,'bowls/obj25__','.png',150,5,4);
zCup       = computeFeatureVectorObject(q,'cups/obj11__','.png',40, 8,7);
zBottle    = computeFeatureVectorObject(q,'bottles/obj50__','.png',40,3,3);
zContainer = computeFeatureVectorObject(q,'container/obj70__','.png',70, 3, 5);
zBirds     = computeFeatureVectorObject(q,'birds/obj74__','.png',60, 4, 4);
zIcecream  = computeFeatureVectorObject(q,'icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

figure(1)
plot(z_num, zGlass(1,:), 'c',...
     z_num, zToy(1,:), 'g',...,
     z_num,zBowl(1,:), 'b',...
     z_num,zCup(1,:), 'c',...            
     z_num,zBottle(1,:),'m',...
     z_num,zContainer(1,:),'y',...
     z_num,zBirds(1,:), 'r',...
     z_num,zIcecream(1,:),'k')  
xlabel('View number') % x-axis label
ylabel('q_1') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

