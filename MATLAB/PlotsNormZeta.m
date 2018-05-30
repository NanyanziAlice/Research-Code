
%%%%%%plots of zeta(p) function against view number of the normalised Laplacian 
             % %%%%

% arguments to the computeZetaNorm() function which 
%first  : p is the value of the zeta argument
%second  : directory of object/image
%third  : image type
%fourth  : number of points/vertices of Delanay graph
%fifth&sixth  : cordinates of the extreme corner points to be deleted  


z_num = (1:72);                                                   % list of view numbers



p = 1;                                                           %set p parameter of the zeta function
zGlass1     = computeZetaNorm(p,'glass/obj18__','.png',90,4,3);   % compute zeta for object 1-glass
zToy1       = computeZetaNorm(p,'toys/obj48__','.png',55,4,4);     % compute zeta for object 2-toy 
zBowl1      = computeZetaNorm(p,'bowls/obj25__','.png',150,5,4);
zCup1       = computeZetaNorm(p,'cups/obj11__','.png',40, 8,7);
zBottle1    = computeZetaNorm(p,'bottles/obj50__','.png',40,3,3);
zContainer1 = computeZetaNorm(p,'container/obj70__','.png',70, 3, 5);
zBirds1     = computeZetaNorm(p,'birds/obj74__','.png',60, 4, 4);
zIcecream1  = computeZetaNorm(p,'icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

figure(1)
plot(z_num, zGlass1, 'Color',[0.2 0.65 0.5])
hold on 
plot(z_num, zToy1, 'Color',[0 1 0])
hold on
plot(z_num,zBowl1, 'Color',[0 0 1])
hold on
plot(z_num,zCup1,'Color',[0 0.95 0.95])
hold on
plot(z_num,zBottle1,'Color',[0.75 0 0.75])
hold on
plot(z_num,zContainer1,'Color',[0.95 0.97 0.1])
hold on
plot(z_num,zBirds1, 'Color',[1 0 0])
hold on
plot(z_num,zIcecream1,'Color',[0 0 0])    
%title('Plot of Zeta function against view number, s=1')
xlabel('View number')                 % x-axis label
ylabel(strcat('Zeta function, \zeta(',int2str(p),')'))     % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')


%%%%%%%%%%%%%%%%%%%%%% p=2  %%%%%%%%%%%%%%%%%%%%%%%
p = 2;
zGlass2     = computeZetaNorm(p,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy2       = computeZetaNorm(p,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl2      = computeZetaNorm(p,'bowls/obj25__','.png',150,5,4);
zCup2       = computeZetaNorm(p,'cups/obj11__','.png',40, 8,7);
zBottle2    = computeZetaNorm(p,'bottles/obj50__','.png',40,3,3);
zContainer2 = computeZetaNorm(p,'container/obj70__','.png',70, 3, 5);
zBirds2     = computeZetaNorm(p,'birds/obj74__','.png',60, 4, 4);
zIcecream2  = computeZetaNorm(p,'icecream/obj72__','.png',80, 4,3);
 
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
%title('Plot of Zeta function against view number, s=1')
xlabel('View number')                 % x-axis label
ylabel(strcat('Zeta function, \zeta(',int2str(p),')'))     % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')


%%%%%%%%%%%%%%%%%%%%%%%%% p=3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = 3;
zGlass3     = computeZetaNorm(p,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy3       = computeZetaNorm(p,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl3      = computeZetaNorm(p,'bowls/obj25__','.png',150,5,4);
zCup3       = computeZetaNorm(p,'cups/obj11__','.png',40, 8,7);
zBottle3    = computeZetaNorm(p,'bottles/obj50__','.png',40,3,3);
zContainer3 = computeZetaNorm(p,'container/obj70__','.png',70, 3, 5);
zBirds3     = computeZetaNorm(p,'birds/obj74__','.png',60, 4, 4);
zIcecream3  = computeZetaNorm(p,'icecream/obj72__','.png',80, 4,3);

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
%title('Plot of Zeta function against view number, s=1')
xlabel('View number')                 % x-axis label
ylabel(strcat('Zeta function, \zeta(',int2str(p),')'))     % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%% p=4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = 4;
zGlass4     = computeZetaNorm(p,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy4       = computeZetaNorm(p,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl4      = computeZetaNorm(p,'bowls/obj25__','.png',150,5,4);
zCup4       = computeZetaNorm(p,'cups/obj11__','.png',40, 8,7);
zBottle4    = computeZetaNorm(p,'bottles/obj50__','.png',40,3,3);
zContainer4 = computeZetaNorm(p,'container/obj70__','.png',70, 3, 5);
zBirds4     = computeZetaNorm(p,'birds/obj74__','.png',60, 4, 4);
zIcecream4  = computeZetaNorm(p,'icecream/obj72__','.png',80, 4,3);

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
%title('Plot of Zeta function against view number, s=1')
xlabel('View number')                 % x-axis label
ylabel(strcat('Zeta function, \zeta(',int2str(p),')'))     % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')