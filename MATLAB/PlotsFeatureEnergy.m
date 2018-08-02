
%%%%%%plots of Laplace energy function against view number 
              %%%normalised Laplacian%%%%%%

% arguments to the computeFeatureEnergy function
%first : directory of object/image
%second  : image type
%third  : number of points/vertices of Delanay graph
%fourth&fifth  : cordinates of the extreme corner points to be deleted             


z_num = (1:72);                                                        % list of view numbers


zGlass     = computeFeatureEnergy('glass/obj18__','.png',90,4,3);       
zToy       = computeFeatureEnergy('toys/obj48__','.png',55,4,4);        
zBowl      = computeFeatureEnergy('bowls/obj25__','.png',150,5,4);
zCup       = computeFeatureEnergy('cups/obj11__','.png',40, 8,7);
zBottle    = computeFeatureEnergy('bottles/obj50__','.png',40,3,3);
zContainer = computeFeatureEnergy('container/obj70__','.png',70, 3, 5);
zBirds     = computeFeatureEnergy('birds/obj74__','.png',60, 4, 4);
zIcecream  = computeFeatureEnergy('icecream/obj72__','.png',80, 4,3);

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
ylabel('Laplacian Energy') % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

