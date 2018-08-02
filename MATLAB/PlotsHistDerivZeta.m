%%%%Histogram of Derivative of zeta function at origin

zGlass     = computeZetaDerOrigin('glass/obj18__','.png',90,4,3);       
zToy       = computeZetaDerOrigin('toys/obj48__','.png',55,4,4);        
zBowl      = computeZetaDerOrigin('bowls/obj25__','.png',150,5,4);
zCup       = computeZetaDerOrigin('cups/obj11__','.png',40, 8,7);
zBottle    = computeZetaDerOrigin('bottles/obj50__','.png',40,3,3);
zContainer = computeZetaDerOrigin('container/obj70__','.png',70, 3, 5);
zBirds     = computeZetaDerOrigin('birds/obj74__','.png',60, 4, 4);
zIcecream  = computeZetaDerOrigin('icecream/obj72__','.png',80, 4,3);

%%%%histograms %%%%

figure(1)
h1 = histogram(zGlass, 'FaceColor',[0.2 0.65 0.5], 'EdgeColor',[0.2 0.65 0.5]);
hold on 
h2 = histogram(zToy, 'FaceColor',[0 1 0], 'EdgeColor',[0 1 0]);
hold on
h3 = histogram(zBowl, 'FaceColor',[0 0 1], 'EdgeColor',[0 0 1]);
hold on
h4 = histogram(zCup,'FaceColor',[0 0.95 0.95], 'EdgeColor',[0 0.95 0.95]);
hold on
h5 = histogram(zBottle,'FaceColor',[0.75 0 0.75], 'EdgeColor',[0.75 0 0.75]);
hold on
h6 = histogram(zContainer,'FaceColor',[0.95 0.97 0.1], 'EdgeColor',[0.95 0.97 0.1]);
hold on
h7 = histogram(zBirds, 'FaceColor',[1 0 0], 'EdgeColor',[1 0 0]);
hold on
h8 = histogram(zIcecream,'FaceColor',[0 0 0], 'EdgeColor',[0 0 0]);   

xlabel('Derivative of Zeta function at Origin') % x-axis label
ylabel('Frequency') % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
l=legend('object1','object2','object3','object4','object5','object6','object7', 'object8');
rect = [0.65, 0.65, .15, .15];
set(l, 'Position', rect)