%%%%%%plots of zeta(p) function against view number of the normalised Laplacian 
             % %%%%

% arguments to the computeZeta() function which 
%first  : p is the value of the zeta argument
%second  : directory of object/image
%third  : image type
%fourth  : number of points/vertices of Delanay graph
%fifth&sixth  : cordinates of the extreme corner points to be deleted  

z_num = (1:72);                                                          % list of view numbers


%%%%%%%%%%%%%%%%%%% p=1 %%%%%%
p = 1;                                                       %set s paprameter of the zeta function

zGlass1     = computeZeta(p,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy1       = computeZeta(p,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl1      = computeZeta(p,'bowls/obj25__','.png',150,5,4);
zCup1       = computeZeta(p,'cups/obj11__','.png',40, 8,7);
zBottle1    = computeZeta(p,'bottles/obj50__','.png',40,3,3);
zContainer1 = computeZeta(p,'container/obj70__','.png',70, 3, 5);
zBirds1     = computeZeta(p,'birds/obj74__','.png',60, 4, 4);
zIcecream1  = computeZeta(p,'icecream/obj72__','.png',80, 4,3);


%%%%Plots %%%%

figure(1)
plot(z_num, zGlass1, 'c',...
     z_num, zToy1, 'g',...
     z_num,zBowl1, 'b',...
     z_num,zCup1,'c',...            
     z_num,zBottle1,'m',...
     z_num,zContainer1,'y',...
     z_num,zBirds1, 'r',...
     z_num,zIcecream1,'k')    
xlabel('View number')                 % x-axis label
ylabel(strcat('Zeta function, \zeta(',int2str(p),')'))     % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')


%%%%% plots of zeta function against view number, p=2   %%%%%%
p = 2;
zGlass2     = computeZeta(p,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy2       = computeZeta(p,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl2      = computeZeta(p,'bowls/obj25__','.png',150,5,4);
zCup2       = computeZeta(p,'cups/obj11__','.png',40, 8,7);
zBottle2    = computeZeta(p,'bottles/obj50__','.png',40,3,3);
zContainer2 = computeZeta(p,'container/obj70__','.png',70, 3, 5);
zBirds2     = computeZeta(p,'birds/obj74__','.png',60, 4, 4);
zIcecream2  = computeZeta(p,'icecream/obj72__','.png',80, 4,3);

figure(2)
%%%%Plots %%%%

figure(2)
plot(z_num, zGlass2, 'c',...
     z_num, zToy2, 'g',...
     z_num,zBowl2, 'b',...
     z_num,zCup2,'c',...            
     z_num,zBottle2,'m',...
     z_num,zContainer2,'y',...
     z_num,zBirds2, 'r',...
     z_num,zIcecream2,'k')    
%title('Plot of Zeta function against view number, s=1')
xlabel('View number')                 % x-axis label
ylabel(strcat('Zeta function, \zeta(',int2str(p),')'))    % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

%plots of zeta function against view number, p=3
p = 3;
zGlass3     = computeZeta(p,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy3       = computeZeta(p,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl3      = computeZeta(p,'bowls/obj25__','.png',150,5,4);
zCup3       = computeZeta(p,'cups/obj11__','.png',40, 8,7);
zBottle3    = computeZeta(p,'bottles/obj50__','.png',40,3,3);
zContainer3 = computeZeta(p,'container/obj70__','.png',70, 3, 5);
zBirds3     = computeZeta(p,'birds/obj74__','.png',60, 4, 4);
zIcecream3  = computeZeta(p,'icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

figure(3)
plot(z_num, zGlass3, 'c',...
     z_num, zToy3, 'g',...
     z_num,zBowl3, 'b',...
     z_num,zCup3,'c',...            
     z_num,zBottle3,'m',...
     z_num,zContainer3,'y',...
     z_num,zBirds3, 'r',...
     z_num,zIcecream3,'k')    
%title('Plot of Zeta function against view number, s=1')
xlabel('View number')                 % x-axis label
ylabel(strcat('Zeta function, \zeta(',int2str(p),')'))    % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

%plots of zeta function against view number, p=4
p = 4;
zGlass4     = computeZeta(p,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy4       = computeZeta(p,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl4      = computeZeta(p,'bowls/obj25__','.png',150,5,4);
zCup4       = computeZeta(p,'cups/obj11__','.png',40, 8,7);
zBottle4    = computeZeta(p,'bottles/obj50__','.png',40,3,3);
zContainer4 = computeZeta(p,'container/obj70__','.png',70, 3, 5);
zBirds4     = computeZeta(p,'birds/obj74__','.png',60, 4, 4);
zIcecream4  = computeZeta(p,'icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

figure(4)
plot(z_num, zGlass4, 'c',...
     z_num, zToy4, 'g',...
     z_num,zBowl4, 'b',...
     z_num,zCup4,'c',...            
     z_num,zBottle4,'m',...
     z_num,zContainer4,'y',...
     z_num,zBirds4, 'r',...
     z_num,zIcecream4,'k')    
xlabel('View number')                 % x-axis label
ylabel(strcat('Zeta function, \zeta(',int2str(s),')'))    % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')