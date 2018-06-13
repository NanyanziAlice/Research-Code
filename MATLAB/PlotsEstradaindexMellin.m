

%%%%%%plots of Laplacian Estrada index against view number of the Generalised normalised Laplacian 
             % for different Mellin exponents%%%%

% arguments to the  computeEstradaIndexMellin() function %%%%%%%%

%first        : mellin exponent,s
%second       : directory of object/image
%third        : image type
%fourth       : number of points/vertices of Delanay graph
%fifth&sixth  : cordinates of the extreme corner points to be deleted
             
z_num = (1:72);                                         % list of view numbers i.e 72 in total

%%%%%%%%%%%%%%%%%%%%%% s=1 %%%%%%%%%%%%%%%%%%%%%%%%%%
s = 1;                                                   % set Mellin argument s

zGlass1     = computeEstradaIndexMellin(s,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy1       = computeEstradaIndexMellin(s,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl1      = computeEstradaIndexMellin(s,'bowls/obj25__','.png',150,5,4);
zCup1       = computeEstradaIndexMellin(s,'cups/obj11__','.png',40, 8,7);
zBottle1    = computeEstradaIndexMellin(s,'bottles/obj50__','.png',40,3,3);
zContainer1 = computeEstradaIndexMellin(s,'container/obj70__','.png',70, 3, 5);
zBirds1     = computeEstradaIndexMellin(s,'birds/obj74__','.png',60, 4, 4);
zIcecream1  = computeEstradaIndexMellin(s,'icecream/obj72__','.png',80, 4,3);


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
ylabel(strcat('Laplacian Estrada index at Mellin S=',int2str(s)))     % y-axis label
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%s=2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s = 2;                                                       % set Mellin argument s

zGlass2     = computeEstradaIndexMellin(s,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy2       = computeEstradaIndexMellin(s,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl2      = computeEstradaIndexMellin(s,'bowls/obj25__','.png',150,5,4);
zCup2       = computeEstradaIndexMellin(s,'cups/obj11__','.png',40, 8,7);
zBottle2    = computeEstradaIndexMellin(s,'bottles/obj50__','.png',40,3,3);
zContainer2 = computeEstradaIndexMellin(s,'container/obj70__','.png',70, 3, 5);
zBirds2     = computeEstradaIndexMellin(s,'birds/obj74__','.png',60, 4, 4);
zIcecream2  = computeEstradaIndexMellin(s,'icecream/obj72__','.png',80, 4,3);


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
ylabel(strcat('Laplacian Estrada index at Mellin S=',int2str(s)))    % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s=3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s = 3;                                                       % set Mellin argument s

zGlass3     = computeEstradaIndexMellin(s,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy3       = computeEstradaIndexMellin(s,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl3      = computeEstradaIndexMellin(s,'bowls/obj25__','.png',150,5,4);
zCup3       = computeEstradaIndexMellin(s,'cups/obj11__','.png',40, 8,7);
zBottle3    = computeEstradaIndexMellin(s,'bottles/obj50__','.png',40,3,3);
zContainer3 = computeEstradaIndexMellin(s,'container/obj70__','.png',70, 3, 5);
zBirds3     = computeEstradaIndexMellin(s,'birds/obj74__','.png',60, 4, 4);
zIcecream3  = computeEstradaIndexMellin(s,'icecream/obj72__','.png',80, 4,3);


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
ylabel(strcat('Laplacian Estrada index at Mellin S=',int2str(s)))    % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s=4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s = 4;                                                       % set Mellin argument s

zGlass4     = computeEstradaIndexMellin(s,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy4       = computeEstradaIndexMellin(s,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl4      = computeEstradaIndexMellin(s,'bowls/obj25__','.png',150,5,4);
zCup4       = computeEstradaIndexMellin(s,'cups/obj11__','.png',40, 8,7);
zBottle4    = computeEstradaIndexMellin(s,'bottles/obj50__','.png',40,3,3);
zContainer4 = computeEstradaIndexMellin(s,'container/obj70__','.png',70, 3, 5);
zBirds4     = computeEstradaIndexMellin(s,'birds/obj74__','.png',60, 4, 4);
zIcecream4  = computeEstradaIndexMellin(s,'icecream/obj72__','.png',80, 4,3);


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
ylabel(strcat('Laplacian Estrada index at Mellin S=',int2str(s)))    % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s=5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s = 5;                                                       % set Mellin argument s

zGlass5     = computeEstradaIndexMellin(s,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy5       = computeEstradaIndexMellin(s,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl5      = computeEstradaIndexMellin(s,'bowls/obj25__','.png',150,5,4);
zCup5       = computeEstradaIndexMellin(s,'cups/obj11__','.png',40, 8,7);
zBottle5    = computeEstradaIndexMellin(s,'bottles/obj50__','.png',40,3,3);
zContainer5 = computeEstradaIndexMellin(s,'container/obj70__','.png',70, 3, 5);
zBirds5     = computeEstradaIndexMellin(s,'birds/obj74__','.png',60, 4, 4);
zIcecream5  = computeEstradaIndexMellin(s,'icecream/obj72__','.png',80, 4,3);


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
%title('Plot of Zeta function against view number, s=1')
xlabel('View number')                 % x-axis label
ylabel(strcat('Laplacian Estrada index at Mellin S=',int2str(s)))    % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')