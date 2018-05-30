%%%%%%plots of zeta function against view number%%%%


%%%%% plots of zeta function against view number, s=2 %%%%%%
s = 1;                                                       %set s paprameter of the zeta function
z_num = (1:72);  % list of view numbers
zGlass     = computeZeta(s,'glass/obj18__','.png',70,4,3);       % compute zeta for object 1-glass
zToy       = computeZeta(s,'toys/obj48__','.png',70,4,4);    % compute zeta for object 2-toy 
zBowl      = computeZeta(s,'bowls/obj25__','.png',30,5,4);
zCup       = computeZeta(s,'cups/obj11__','.png',30, 8,7);
zBottle    = computeZeta(s,'bottles/obj50__','.png',70,3,3);
zContainer = computeZeta(s,'container/obj70__','.png',70, 3, 5);
zBirds     = computeZeta(s,'birds/obj74__','.png',30, 4, 4);
zIcecream  = computeZeta(s,'icecream/obj72__','.png',50, 4,3);

figure(1)
plot(z_num, zGlass, z_num, zToy,z_num,zBowl, z_num,zCup,...        %plots for zeta function against view number 
    z_num,zBottle, z_num,zContainer, z_num,zBirds, z_num,zIcecream)% for the eight objects
%title('Plot of Zeta function against view number, s=1')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(1)') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')


%%%%% plots of zeta function against view number, s=2   %%%%%%
s = 2;
zGlass2     = computeZeta(s,'glass/obj18__','.png',70,4,3);
zToy2       = computeZeta(s,'toys/obj48__','.png',70,4,4);
zBowl2      = computeZeta(s,'bowls/obj25__','.png',30,5,4);
zCup2       = computeZeta(s,'cups/obj11__','.png',30, 8,7);
zBottle2    = computeZeta(s,'bottles/obj50__','.png',70,3,3);
zContainer2 = computeZeta(s,'container/obj70__','.png',70, 3, 5);
zBirds2     = computeZeta(s,'birds/obj74__','.png',30, 4, 4);
zIcecream2  = computeZeta(s,'icecream/obj72__','.png',50, 4,3);

figure(2)
plot(z_num, zGlass2, z_num, zToy2,z_num,zBowl2, z_num,zCup2, ...
    z_num,zBottle2, z_num,zContainer2, z_num,zBirds2, z_num,zIcecream2)
%title('Plot of Zeta function against view number, s=2')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(2)') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

%plots of zeta function against view number, s=3
s = 3;
zGlass3     = computeZeta(s,'glass/obj18__','.png',70,4,3);
zToy3       = computeZeta(s,'toys/obj48__','.png',70,4,4);
zBowl3      = computeZeta(s,'bowls/obj25__','.png',30,5,4);
zCup3       = computeZeta(s,'cups/obj11__','.png',30, 8,7);
zBottle3    = computeZeta(s,'bottles/obj50__','.png',70,3,3);
zContainer3 = computeZeta(s,'container/obj70__','.png',70, 3, 5);
zBirds3     = computeZeta(s,'birds/obj74__','.png',30, 4, 4);
zIcecream3  = computeZeta(s,'icecream/obj72__','.png',50, 4,3);

figure(3)
plot(z_num, zGlass3, z_num, zToy3,z_num,zBowl3, z_num,zCup3, ...
    z_num,zBottle3, z_num,zContainer3, z_num,zBirds3, z_num,zIcecream3)
%title('Plot of Zeta function against view number, s=3')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(3)') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

%plots of zeta function against view number, s=3
s = 4;
zGlass4     = computeZeta(s,'glass/obj18__','.png',70,4,3);
zToy4       = computeZeta(s,'toys/obj48__','.png',70,4,4);
zBowl4      = computeZeta(s,'bowls/obj25__','.png',30,5,4);
zCup4       = computeZeta(s,'cups/obj11__','.png',30, 8,7);
zBottle4    = computeZeta(s,'bottles/obj50__','.png',70,3,3);
zContainer4 = computeZeta(s,'container/obj70__','.png',70, 3, 5);
zBirds4     = computeZeta(s,'birds/obj74__','.png',30, 4, 4);
zIcecream4  = computeZeta(s,'icecream/obj72__','.png',50, 4,3);

figure(4)
plot(z_num, zGlass4, z_num, zToy4,z_num,zBowl4, z_num,zCup4, ...
    z_num,zBottle4, z_num,zContainer4, z_num,zBirds4, z_num,zIcecream4)
%title('Plot of Zeta function against view number, s=4')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(4)') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
