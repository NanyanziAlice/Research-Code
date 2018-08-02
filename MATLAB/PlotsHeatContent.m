
%Plots of Heat content (Normalised Laplacian) %%%%%%


% arguments to the computeHeatContent() function %%%%%%%%
%first  : value of time, t
%second  : directory of object/image
%third  : image type
%forth  : number of points/vertices of Delanay graph
%fifth&sixth  : cordinates of the extreme corner points to be deleted

z_num = (1:72);                                                   % list of view numbers


%% plots of heat content, t=1   %%%%%%;                                                       
t=[0 1 2 3 4 5];
zGlass1     =  computeHeatContent(t,'glass/obj18__','.png',90,4,3);       % compute heat content for object 1-glass
zToy1       =  computeHeatContent(t,'toys/obj48__','.png',55,4,4);       % compute heat content for object 2-toy 
zBowl1      =  computeHeatContent(t,'bowls/obj25__','.png',150,5,4);
zCup1       =  computeHeatContent(t,'cups/obj11__','.png',40, 8,7);
zBottle1    =  computeHeatContent(t,'bottles/obj50__','.png',40,3,3);
zContainer1 =  computeHeatContent(t,'container/obj70__','.png',70, 3, 5);
zBirds1     =  computeHeatContent(t,'birds/obj74__','.png',60, 4, 4);
zIcecream1  =  computeHeatContent(t,'icecream/obj72__','.png',80, 4,3);


%%%%Plots %%%%

figure(1)
% plot(t,zGlass1(:,1), 'c',...
%      t, zGlass1(:,2), 'c')
%      z_num, zToy1, 'g',...
%      z_num,zBowl1, 'b',...
%      z_num,zCup1,'c',...            
%      z_num,zBottle1,'m',...
%      z_num,zContainer1,'y',...
%      z_num,zBirds1, 'r',...
%      z_num,zIcecream1,'k'
% )
for v = z_num
  plot(t,zGlass1(:,v), 'c') ;
  hold on
  plot(t,zToy1(:,v), 'g') ;
  hold on;
  plot(t,zBowl1(:,v), 'b');
  hold on;
  plot(t,zCup1(:,v),'c');
  hold on;
  plot(t,zBottle1(:,v),'m');
  hold on;
  plot(t,zContainer1(:,v),'y');
  hold on;
  plot(t,zBirds1(:,v), 'r');
  hold on;
  plot(t,zIcecream1(:,v),'k');
  hold on;
end
xlabel('View number') % x-axis label
ylabel('Q(1) value') % y-axis label
legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')


% %% plots of heat content, t=2   %%%%%%
% t=2;
% 
% zGlass2     =  computeHeatContent(t,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
% zToy2       =  computeHeatContent(t,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
% zBowl2      =  computeHeatContent(t,'bowls/obj25__','.png',150,5,4);
% zCup2       =  computeHeatContent(t,'cups/obj11__','.png',40, 8,7);
% zBottle2    =  computeHeatContent(t,'bottles/obj50__','.png',40,3,3);
% zContainer2 =  computeHeatContent(t,'container/obj70__','.png',70, 3, 5);
% zBirds2     =  computeHeatContent(t,'birds/obj74__','.png',60, 4, 4);
% zIcecream2  =  computeHeatContent(t,'icecream/obj72__','.png',80, 4,3);
% 
% %%%%Plots %%%%
% 
% figure(2)
% plot(z_num, zGlass2, 'c',...
%      z_num, zToy2, 'g',...
%      z_num,zBowl2, 'b',...
%      z_num,zCup2,'c',...            
%      z_num,zBottle2,'m',...
%      z_num,zContainer2,'y',...
%      z_num,zBirds2, 'r',...
%      z_num,zIcecream2,'k') 
% xlabel('view number') % x-axis label
% ylabel('Q(2) value') % y-axis label
% legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
% 
% 
% 
% %% plots of heat content, t=3 %%
% t=3;
% 
% zGlass3     =  computeHeatContent(t,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
% zToy3       =  computeHeatContent(t,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
% zBowl3      =  computeHeatContent(t,'bowls/obj25__','.png',150,5,4);
% zCup3       =  computeHeatContent(t,'cups/obj11__','.png',40, 8,7);
% zBottle3    =  computeHeatContent(t,'bottles/obj50__','.png',40,3,3);
% zContainer3 =  computeHeatContent(t,'container/obj70__','.png',70, 3, 5);
% zBirds3     =  computeHeatContent(t,'birds/obj74__','.png',60, 4, 4);
% zIcecream3  =  computeHeatContent(t,'icecream/obj72__','.png',80, 4,3);
% 
% %%%%Plots %%%%
% 
% figure(3)
% plot(z_num, zGlass3, 'c',...
%      z_num, zToy3, 'g',...
%      z_num,zBowl3, 'b',...
%      z_num,zCup3,'c',...            
%      z_num,zBottle3,'m',...
%      z_num,zContainer3,'y',...
%      z_num,zBirds3, 'r',...
%      z_num,zIcecream3,'k')   
% xlabel('view number') % x-axis label
% ylabel('Q(3) value') % y-axis label
% legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
% 
% %% plots of heat content, t=4 %%%%%%%%%%%%%%%%%%%%%
% t=4;
% 
% zGlass4     =  computeHeatContent(t,'glass/obj18__','.png',90,4,3);       % compute zeta for object 1-glass
% zToy4       =  computeHeatContent(t,'toys/obj48__','.png',55,4,4);    % compute zeta for object 2-toy 
% zBowl4      =  computeHeatContent(t,'bowls/obj25__','.png',150,5,4);
% zCup4       =  computeHeatContent(t,'cups/obj11__','.png',40, 8,7);
% zBottle4    =  computeHeatContent(t,'bottles/obj50__','.png',40,3,3);
% zContainer4 =  computeHeatContent(t,'container/obj70__','.png',70, 3, 5);
% zBirds4     =  computeHeatContent(t,'birds/obj74__','.png',60, 4, 4);
% zIcecream4  =  computeHeatContent(t,'icecream/obj72__','.png',80, 4,3);
% 
% %%%%Plots %%%%
% 
% figure(4)
% plot(z_num, zGlass4, 'c',...
%      z_num, zToy4, 'g',...
%      z_num,zBowl4, 'b',...
%      z_num,zCup4,'c',...            
%      z_num,zBottle4,'m',...
%      z_num,zContainer4,'y',...
%      z_num,zBirds4, 'r',...
%      z_num,zIcecream4,'k') 
% xlabel('view number') % x-axis label
% ylabel('Q(4) value') % y-axis label
% legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
% 
