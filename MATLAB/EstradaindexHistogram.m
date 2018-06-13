%%%%%%plots of Derivative of zeta(p) function at Origin against view number 
              %%%normalised Laplacian%%%%%%

% arguments to the computeEstradaIndex function
%first : directory of object/image
%second  : image type
%third  : number of points/vertices of Delanay graph
%fourth&fifth  : cordinates of the extreme corner points to be deleted             


z_num = (1:72);                                                        % list of view numbers


zGlass     = computeEstradaIndex('glass/obj18__','.png',90,4,3);       
zToy       = computeEstradaIndex('toys/obj48__','.png',55,4,4);        
zBowl      = computeEstradaIndex('bowls/obj25__','.png',150,5,4);
zCup       = computeEstradaIndex('cups/obj11__','.png',40, 8,7);
zBottle    = computeEstradaIndex('bottles/obj50__','.png',40,3,3);
zContainer = computeEstradaIndex('container/obj70__','.png',70, 3, 5);
zBirds     = computeEstradaIndex('birds/obj74__','.png',60, 4, 4);
zIcecream  = computeEstradaIndex('icecream/obj72__','.png',80, 4,3);

%%%%Plots %%%%

h1 = histogram(zGlass,'FaceColor',[0.2 0.65 0.5], 'EdgeColor',[0.2 0.65 0.5]);
hold on 
h2 = histogram(zToy, 'FaceColor',[0 1 0], 'EdgeColor',[0 1 0]);
hold on
h3 = histogram(zBowl, 'FaceColor',[0 0 1], 'EdgeColor',[0 0 1]);
hold on
h4 = histogram(zCup,'FaceColor',[0 0.95 0.95], 'EdgeColor',[0 0.95 0.95]);
hold on
h5 = histogram(zBottle,'FaceColor',[0.75 0 0.75], 'EdgeColor',[0.75 0 0.75]);
hold on
h6 = histogram(zContainer,'FaceColor',[0.95 0.97 0.1],'EdgeColor',[0.95 0.97 0.1]);
hold on
h7 = histogram(zBirds, 'FaceColor',[1 0 0],'EdgeColor',[1 0 0] );
hold on
h8 = histogram(zIcecream,'FaceColor',[0 0 0],'EdgeColor',[0 0 0] );   

ylabel('Frequency') % x-axis label
xlabel('Laplacian Estrada Index') % y-axis label
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')
