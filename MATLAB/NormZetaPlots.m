
%%%%%%plots of zeta function (normalised) against view number%%%%

z_num = (1:72);  % list of view numbers
%%%%% plots of zeta function against view number, s=2 %%%%%%
s = 1;                                                       %set s paprameter of the zeta function
zGlass     = computeZetaNorm(s,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy       = computeZetaNorm(s,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl      = computeZetaNorm(s,'bowls/obj25__','.png',150,5,4);
zCup       = computeZetaNorm(s,'cups/obj11__','.png',40, 8,7);
zBottle    = computeZetaNorm(s,'bottles/obj50__','.png',40,3,3);
zContainer = computeZetaNorm(s,'container/obj70__','.png',70, 3, 5);
zBirds     = computeZetaNorm(s,'birds/obj74__','.png',60, 4, 4);
zIcecream  = computeZetaNorm(s,'icecream/obj72__','.png',80, 4,3);

figure(1)
plot(z_num, zGlass, z_num, zToy,z_num,zBowl, z_num,zCup,...        %plots for zeta function against view number 
    z_num,zBottle, z_num,zContainer, z_num,zBirds, z_num,zIcecream)% for the eight objects
title('Plot of Zeta function against view number, s=1')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(1)') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')


%%%%% plots of zeta function against view number, s=2   %%%%%%
s = 2;
zGlass2     = computeZetaNorm(s,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy2       = computeZetaNorm(s,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl2      = computeZetaNorm(s,'bowls/obj25__','.png',150,5,4);
zCup2       = computeZetaNorm(s,'cups/obj11__','.png',40, 8,7);
zBottle2    = computeZetaNorm(s,'bottles/obj50__','.png',40,3,3);
zContainer2 = computeZetaNorm(s,'container/obj70__','.png',70, 3, 5);
zBirds2     = computeZetaNorm(s,'birds/obj74__','.png',60, 4, 4);
zIcecream2  = computeZetaNorm(s,'icecream/obj72__','.png',80, 4,3);
 
figure(2)
plot(z_num, zGlass2, z_num, zToy2,z_num,zBowl2, z_num,zCup2, ...
    z_num,zBottle2, z_num,zContainer2, z_num,zBirds2, z_num,zIcecream2)
title('Plot of Zeta function against view number, s=2')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(2)') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

% %plots of zeta function against view number, s=3
s = 3;
zGlass3     = computeZetaNorm(s,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy3       = computeZetaNorm(s,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl3      = computeZetaNorm(s,'bowls/obj25__','.png',150,5,4);
zCup3       = computeZetaNorm(s,'cups/obj11__','.png',40, 8,7);
zBottle3    = computeZetaNorm(s,'bottles/obj50__','.png',40,3,3);
zContainer3 = computeZetaNorm(s,'container/obj70__','.png',70, 3, 5);
zBirds3     = computeZetaNorm(s,'birds/obj74__','.png',60, 4, 4);
zIcecream3  = computeZetaNorm(s,'icecream/obj72__','.png',80, 4,3);

figure(3)
plot(z_num, zGlass3, z_num, zToy3,z_num,zBowl3, z_num,zCup3, ...
    z_num,zBottle3, z_num,zContainer3, z_num,zBirds3, z_num,zIcecream3)
title('Plot of Zeta function against view number, s=3')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(3)') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

% %plots of zeta function against view number, s=3
s = 4;
zGlass4     = computeZetaNorm(s,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy4       = computeZetaNorm(s,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl4      = computeZetaNorm(s,'bowls/obj25__','.png',150,5,4);
zCup4       = computeZetaNorm(s,'cups/obj11__','.png',40, 8,7);
zBottle4    = computeZetaNorm(s,'bottles/obj50__','.png',40,3,3);
zContainer4 = computeZetaNorm(s,'container/obj70__','.png',70, 3, 5);
zBirds4     = computeZetaNorm(s,'birds/obj74__','.png',60, 4, 4);
zIcecream4  = computeZetaNorm(s,'icecream/obj72__','.png',80, 4,3);

figure(4)
plot(z_num, zGlass4, z_num, zToy4,z_num,zBowl4, z_num,zCup4, ...
    z_num,zBottle4, z_num,zContainer4, z_num,zBirds4, z_num,zIcecream4)
title('Plot of Zeta function against view number, s=4')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(4)') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
