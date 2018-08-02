
% arguments to the computeZetaDerOrigin function
%first : directory of object/image
%second  : image type
%third  : number of points/vertices of Delanay graph
%fourth&fifth  : cordinates of the extreme corner points to be deleted             


z_num = (1:72);                                                        % list of view numbers

lam=1;
zGlass     = computeZetaDerOriginLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy       = computeZetaDerOriginLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl      = computeZetaDerOriginLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup       = computeZetaDerOriginLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle    = computeZetaDerOriginLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer = computeZetaDerOriginLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds     = computeZetaDerOriginLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream  = computeZetaDerOriginLaplace(lam,'icecream/obj72__','.png',80, 4,3);

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
ylabel(strcat('Derivative of Zeta function value at Origin at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%lam=2%%%%%%%%%%%%%%%%
lam=2;
zGlass2     = computeZetaDerOriginLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy2       = computeZetaDerOriginLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl2      = computeZetaDerOriginLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup2       = computeZetaDerOriginLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle2    = computeZetaDerOriginLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer2 = computeZetaDerOriginLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds2     = computeZetaDerOriginLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream2  = computeZetaDerOriginLaplace(lam,'icecream/obj72__','.png',80, 4,3);

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
ylabel(strcat('Derivative of Zeta function value at Origin at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%lam=3%%%%%%%%%%%%%%%%
lam=3;
zGlass3     = computeZetaDerOriginLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy3       = computeZetaDerOriginLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl3      = computeZetaDerOriginLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup3       = computeZetaDerOriginLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle3    = computeZetaDerOriginLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer3 = computeZetaDerOriginLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds3     = computeZetaDerOriginLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream3  = computeZetaDerOriginLaplace(lam,'icecream/obj72__','.png',80, 4,3);

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
ylabel(strcat('Derivative of Zeta function value at Origin at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%lam=4%%%%%%%%%%%%%%%%
lam=4;
zGlass4     = computeZetaDerOriginLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy4       = computeZetaDerOriginLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl4      = computeZetaDerOriginLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup4       = computeZetaDerOriginLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle4    = computeZetaDerOriginLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer4 = computeZetaDerOriginLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds4     = computeZetaDerOriginLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream4  = computeZetaDerOriginLaplace(lam,'icecream/obj72__','.png',80, 4,3);

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
ylabel(strcat('Derivative of Zeta function value at Origin at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%lam=5%%%%%%%%%%%%%%%%
lam=5;
zGlass5     = computeZetaDerOriginLaplace(lam,'glass/obj18__','.png',90,4,3);       
zToy5       = computeZetaDerOriginLaplace(lam,'toys/obj48__','.png',55,4,4);        
zBowl5      = computeZetaDerOriginLaplace(lam,'bowls/obj25__','.png',150,5,4);
zCup5       = computeZetaDerOriginLaplace(lam,'cups/obj11__','.png',40, 8,7);
zBottle5    = computeZetaDerOriginLaplace(lam,'bottles/obj50__','.png',40,3,3);
zContainer5 = computeZetaDerOriginLaplace(lam,'container/obj70__','.png',70, 3, 5);
zBirds5     = computeZetaDerOriginLaplace(lam,'birds/obj74__','.png',60, 4, 4);
zIcecream5  = computeZetaDerOriginLaplace(lam,'icecream/obj72__','.png',80, 4,3);

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
ylabel(strcat('Derivative of Zeta function value at Origin at \lambda =',int2str(lam))) % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')
