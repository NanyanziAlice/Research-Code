
%%%%%%plots of zeta function against view number%%%%

z_num = (1:72);  % list of view numbers
%%%%% plots of zeta function against view number, s=1 %%%%%%
m = 1;                                                       %set s paprameter of the zeta function


zGlass     =  computePolyCoeff(m,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy       =  computePolyCoeff(m,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl      =  computePolyCoeff(m,'bowls/obj25__','.png',150,5,4);
zCup       =  computePolyCoeff(m,'cups/obj11__','.png',40, 8,7);
zBottle    =  computePolyCoeff(m,'bottles/obj50__','.png',40,3,3);
zContainer =  computePolyCoeff(m,'container/obj70__','.png',70, 3, 5);
zBirds     =  computePolyCoeff(m,'birds/obj74__','.png',60, 4, 4);
zIcecream  =  computePolyCoeff(m,'icecream/obj72__','.png',80, 4,3);


figure(1)
plot(z_num, zGlass, z_num, zToy,z_num,zBowl, z_num,zCup,...        %plots for zeta function against view number 
    z_num,zBottle, z_num,zContainer, z_num,zBirds, z_num,zIcecream)% for the eight objects
%title('Plot of Zeta function against view number, s=1')
xlabel('view number') % x-axis label
ylabel('Q(1) value') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')


%%%%% plots of zeta function against view number, s=2   %%%%%%
m=2;

zGlass2     =  computePolyCoeff(m,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy2       =  computePolyCoeff(m,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl2      =  computePolyCoeff(m,'bowls/obj25__','.png',150,5,4);
zCup2       =  computePolyCoeff(m,'cups/obj11__','.png',40, 8,7);
zBottle2    =  computePolyCoeff(m,'bottles/obj50__','.png',40,3,3);
zContainer2 =  computePolyCoeff(m,'container/obj70__','.png',70, 3, 5);
zBirds2     =  computePolyCoeff(m,'birds/obj74__','.png',60, 4, 4);
zIcecream2  =  computePolyCoeff(m,'icecream/obj72__','.png',80, 4,3);
figure(2)
plot(z_num, zGlass2, z_num, zToy2,z_num,zBowl2, z_num,zCup2, ...
    z_num,zBottle2, z_num,zContainer2, z_num,zBirds2, z_num,zIcecream2)
%title('Plot of Zeta function against view number, s=2')
xlabel('view number') % x-axis label
ylabel('Q(2) value') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')



%plots of zeta function against view number, s=3
m=3;

zGlass3     =  computePolyCoeff(m,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy3       =  computePolyCoeff(m,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl3      =  computePolyCoeff(m,'bowls/obj25__','.png',150,5,4);
zCup3       =  computePolyCoeff(m,'cups/obj11__','.png',40, 8,7);
zBottle3    =  computePolyCoeff(m,'bottles/obj50__','.png',40,3,3);
zContainer3 =  computePolyCoeff(m,'container/obj70__','.png',70, 3, 5);
zBirds3     =  computePolyCoeff(m,'birds/obj74__','.png',60, 4, 4);
zIcecream3  =  computePolyCoeff(m,'icecream/obj72__','.png',80, 4,3);

figure(3)
plot(z_num, zGlass3, z_num, zToy3,z_num,zBowl3, z_num,zCup3, ...
    z_num,zBottle3, z_num,zContainer3, z_num,zBirds3, z_num,zIcecream3)
%title('Plot of Zeta function against view number, s=3')
xlabel('view number') % x-axis label
ylabel('Q(3) value') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

%plots of zeta function against view number, s=3
m=4;

zGlass4     =  computePolyCoeff(m,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy4       =  computePolyCoeff(m,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl4      =  computePolyCoeff(m,'bowls/obj25__','.png',150,5,4);
zCup4       =  computePolyCoeff(m,'cups/obj11__','.png',40, 8,7);
zBottle4    =  computePolyCoeff(m,'bottles/obj50__','.png',40,3,3);
zContainer4 =  computePolyCoeff(m,'container/obj70__','.png',70, 3, 5);
zBirds4     =  computePolyCoeff(m,'birds/obj74__','.png',60, 4, 4);
zIcecream4  =  computePolyCoeff(m,'icecream/obj72__','.png',80, 4,3);
figure(4)
plot(z_num, zGlass4, z_num, zToy4,z_num,zBowl4, z_num,zCup4, ...
    z_num,zBottle4, z_num,zContainer4, z_num,zBirds4, z_num,zIcecream4)
%title('Plot of Zeta function against view number, s=4')
xlabel('view number') % x-axis label
ylabel('Q(4) value') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

