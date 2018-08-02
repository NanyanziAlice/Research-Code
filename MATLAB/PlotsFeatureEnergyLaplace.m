
%%%%%%plots of Laplace energy function against view number 
              %%%Laplace-based normalised Laplacian%%%%%%

% arguments to the computeFeatureEnergy function
%first: laplace exponent
%second : directory of object/image
%third  : image type
%fourth  : number of points/vertices of Delanay graph
%fifth&sixth  : cordinates of the extreme corner points to be deleted             


z_num = (1:72);                                                        % list of view numbers

lam=1;
zGlass     = computeFeatureEnergyLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy       = computeFeatureEnergyLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl      = computeFeatureEnergyLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup       = computeFeatureEnergyLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle    = computeFeatureEnergyLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer = computeFeatureEnergyLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds     = computeFeatureEnergyLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream  = computeFeatureEnergyLaplace(lam,'icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

figure(1)
plot(z_num, zGlass, 'Color',[0.2 0.65 0.5])
hold on 
plot(z_num, zToy, 'Color',[0 1 0])
hold on
plot(z_num,zBowl, 'Color',[0 0 1])
hold on
plot(z_num,zCup,'Color',[0 0.95 0.95])
hold on
plot(z_num,zBottle,'Color',[0.75 0 0.75])
hold on
plot(z_num,zContainer,'Color',[0.95 0.97 0.1])
hold on
plot(z_num,zBirds, 'Color',[1 0 0])
hold on
plot(z_num,zIcecream,'Color',[0 0 0])   

xlabel('View number') % x-axis label
ylabel(strcat('Laplacian Energy at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s=2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lam=2;
zGlass2     = computeFeatureEnergyLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy2       = computeFeatureEnergyLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl2      = computeFeatureEnergyLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup2       = computeFeatureEnergyLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle2    = computeFeatureEnergyLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer2 = computeFeatureEnergyLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds2     = computeFeatureEnergyLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream2  = computeFeatureEnergyLaplace(lam,'icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

figure(2)
plot(z_num, zGlass2, 'Color',[0.2 0.65 0.5])
hold on 
plot(z_num, zToy2, 'Color',[0 1 0])
hold on
plot(z_num,zBowl2, 'Color',[0 0 1])
hold on
plot(z_num,zCup2,'Color',[0 0.95 0.95])
hold on
plot(z_num,zBottle2,'Color',[0.75 0 0.75])
hold on
plot(z_num,zContainer2,'Color',[0.95 0.97 0.1])
hold on
plot(z_num,zBirds2, 'Color',[1 0 0])
hold on
plot(z_num,zIcecream2,'Color',[0 0 0])   

xlabel('View number') % x-axis label
ylabel(strcat('Laplacian Energy at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s=3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lam=3;
zGlass3     = computeFeatureEnergyLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy3       = computeFeatureEnergyLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl3      = computeFeatureEnergyLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup3       = computeFeatureEnergyLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle3    = computeFeatureEnergyLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer3 = computeFeatureEnergyLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds3     = computeFeatureEnergyLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream3  = computeFeatureEnergyLaplace(lam,'icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

figure(3)
plot(z_num, zGlass3, 'Color',[0.2 0.65 0.5])
hold on 
plot(z_num, zToy3, 'Color',[0 1 0])
hold on
plot(z_num,zBowl3, 'Color',[0 0 1])
hold on
plot(z_num,zCup3,'Color',[0 0.95 0.95])
hold on
plot(z_num,zBottle3,'Color',[0.75 0 0.75])
hold on
plot(z_num,zContainer3,'Color',[0.95 0.97 0.1])
hold on
plot(z_num,zBirds3, 'Color',[1 0 0])
hold on
plot(z_num,zIcecream3,'Color',[0 0 0])   

xlabel('View number') % x-axis label
ylabel(strcat('Laplacian Energy at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s=4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lam=4;
zGlass4     = computeFeatureEnergyLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy4       = computeFeatureEnergyLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl4      = computeFeatureEnergyLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup4       = computeFeatureEnergyLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle4    = computeFeatureEnergyLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer4 = computeFeatureEnergyLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds4     = computeFeatureEnergyLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream4  = computeFeatureEnergyLaplace(lam,'icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

figure(4)
plot(z_num, zGlass4, 'Color',[0.2 0.65 0.5])
hold on 
plot(z_num, zToy4, 'Color',[0 1 0])
hold on
plot(z_num,zBowl4, 'Color',[0 0 1])
hold on
plot(z_num,zCup4,'Color',[0 0.95 0.95])
hold on
plot(z_num,zBottle4,'Color',[0.75 0 0.75])
hold on
plot(z_num,zContainer4,'Color',[0.95 0.97 0.1])
hold on
plot(z_num,zBirds4, 'Color',[1 0 0])
hold on
plot(z_num,zIcecream4,'Color',[0 0 0])   

xlabel('View number') % x-axis label
ylabel(strcat('Laplacian Energy at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s=5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lam=5;
zGlass5     = computeFeatureEnergyLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy5       = computeFeatureEnergyLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl5      = computeFeatureEnergyLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup5       = computeFeatureEnergyLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle5    = computeFeatureEnergyLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer5 = computeFeatureEnergyLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds5     = computeFeatureEnergyLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream5  = computeFeatureEnergyLaplace(lam,'icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

figure(5)
plot(z_num, zGlass5, 'Color',[0.2 0.65 0.5])
hold on 
plot(z_num, zToy5, 'Color',[0 1 0])
hold on
plot(z_num,zBowl5, 'Color',[0 0 1])
hold on
plot(z_num,zCup5,'Color',[0 0.95 0.95])
hold on
plot(z_num,zBottle5,'Color',[0.75 0 0.75])
hold on
plot(z_num,zContainer5,'Color',[0.95 0.97 0.1])
hold on
plot(z_num,zBirds5, 'Color',[1 0 0])
hold on
plot(z_num,zIcecream5,'Color',[0 0 0])   

xlabel('View number') % x-axis label
ylabel(strcat('Laplacian Energy at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

