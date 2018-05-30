%%%%%%plots of zeta function against view number%%%%


%%%%% plots of zeta function against view number, s=2 %%%%%%
z_num = (1:72);  % list of view numbers
zGlass     = computeZetaDerOrigin('glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
zToy       = computeZetaDerOrigin('toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
zBowl      = computeZetaDerOrigin('bowls/obj25__','.png',150,5,4);
zCup       = computeZetaDerOrigin('cups/obj11__','.png',40, 8,7);
zBottle    = computeZetaDerOrigin('bottles/obj50__','.png',40,3,3);
zContainer = computeZetaDerOrigin('container/obj70__','.png',70, 3, 5);
zBirds     = computeZetaDerOrigin('birds/obj74__','.png',60, 4, 4);
zIcecream  = computeZetaDerOrigin('icecream/obj72__','.png',80, 4,3);

figure(1)
plot(z_num, zGlass, z_num, zToy,z_num,zBowl, z_num,zCup,...        %plots for zeta function against view number 
    z_num,zBottle, z_num,zContainer, z_num,zBirds, z_num,zIcecream)% for the eight objects
%title('Plot of Zeta function against view number, s=1')
xlabel('View number') % x-axis label
ylabel('Derivative of Zeta function value at Origin') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')

