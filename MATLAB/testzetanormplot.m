%%%%%%plots of zeta function against view number%%%%

z_num = (0 : 1: 71);  % list of view numbers
%%%%% plots of zeta function against view number, s=2 %%%%%%
s = 2;                                                       %set s paprameter of the zeta function

zGlass     = computeZetaNorm(s,'glass/obj18__','.png',150,4,3);       % compute zeta for object 1-glass
zToy       = computeZetaNorm(s,'toys/obj48__','.png',30,4,4);    % compute zeta for object 2-toy 
zBowl      = computeZetaNorm(s,'bowls/obj25__','.png',50,5,4);
zCup       = computeZetaNorm(s,'cups/obj11__','.png',10, 8,7);
zBottle    = computeZetaNorm(s,'bottles/obj50__','.png',70,3,3);
zContainer = computeZetaNorm(s,'container/obj70__','.png',70, 3, 5);
zBirds     = computeZetaNorm(s,'birds/obj74__','.png',50, 4, 4);
zIcecream  = computeZetaNorm(s,'icecream/obj72__','.png',50, 4,3);

figure(1)
plot(z_num, zGlass, z_num, zToy,z_num,zBowl, z_num,zCup,...        %plots for zeta function against view number 
    z_num,zBottle, z_num,zContainer, z_num,zBirds, z_num,zIcecream)% for the eight objects
%title('Plot of Zeta function against view number, s=1')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(1)') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')