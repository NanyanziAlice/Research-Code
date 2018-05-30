%%%%plots for zeta function against view number for different Mellin transforms%%

s  = 1;                                                                % set s parameter for zeta function 
sm = [1,2,3,4];                                                        % Set list of s values for Mellin transform
z_num = [0 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80];            % list of view numbers
zGlassOrig     = computeZeta(s,'glass/obj18__','.png',70,4,3);         % Zeta function without mellin trnaform influence
zGlass         = computeMellinZeta(sm,s,'glass/obj18__','.png',70,4,3);% Zeta function for mellin for different s values as given in the list sm
%zToy       = computeZeta(s,'toys/obj48__','.png',70,4,4);
%zBowl      = computeZeta(s,'bowls/obj25__','.png',30,5,4);
%zCup       = computeZeta(s,'cups/obj11__','.png',30, 8,7);
%zBottle    = computeZeta(s,'bottles/obj50__','.png',70,3,3);
%zContainer = computeZeta(s,'container/obj70__','.png',70, 3, 5);
%zBirds     = computeZeta(s,'birds/obj74__','.png',30, 4, 4);
%zIcecream  = computeZeta(s,'icecream/obj72__','.png',50, 4,3);

figure(1)
plot(z_num, zGlassOrig,z_num, zGlass)                                    %plots for original and for mellin transformed graphs of the glass
title('Zeta function \zeta(1) against view number for Mellin transforms')
xlabel('view number') % x-axis label
ylabel('Zeta function, \zeta(1)') % y-axis label
legend('original','s_{(M)}=1','s_{(M)}=2','s_{(M)}=3','s_{(M)}=4')

