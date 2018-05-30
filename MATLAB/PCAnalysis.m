%PCA analysis

%compute feature vector of la placian eigenvalues for the objects
s = 6;                                                                %size of the leading eigenvalues
egGlass     = computeFeatureVector(s,'glass/obj18__','.png',70,4,3)';%compute feature vector for each of the eight objects
egToy       = computeFeatureVector(s,'toys/obj48__','.png',70,4,4)'; 
egBowl      = computeFeatureVector(s,'bowls/obj25__','.png',30,5,4)';
egCup       = computeFeatureVector(s,'cups/obj11__','.png',30, 8,7)';
egBottle    = computeFeatureVector(s,'bottles/obj50__','.png',70,3,3)';
egContainer = computeFeatureVector(s,'container/obj70__','.png',70, 3, 5)';
egBird      = computeFeatureVector(s,'birds/obj74__','.png',30, 4, 4)';
egIcecream  = computeFeatureVector(s,'icecream/obj72__','.png',50, 4,3)';


Gcomp  =  pca(egGlass);                %perform pca on the transformed feature vector of the Glass object: The transform males the eigenvalues as dimensions
Gcomp  =  Gcomp(:,1:3);                % choose 3 principal components which are the first three columns: each column is eigenvector    
NewGlass = (Gcomp(:,1:3)'* egGlass')'; % New data is given as transform of the product of trnaspose of principal components matrix and feature vector


%pca and new data for Toy object
Tcomp  =  pca(egToy); Tcomp  =  Tcomp(:,1:3); NewToy = (Tcomp(:,1:3)'* egToy')';

%pca and new data for Bowl object
Bcomp   =  pca(egBowl); Bcomp   =  Bcomp(:,1:3);NewBowl = (Bcomp(:,1:3)'* egBowl')';

%pca and new data for cup object
Ccomp  =  pca(egCup);Ccomp  =  Ccomp(:,1:3); NewCup = (Ccomp(:,1:3)'* egCup')';

%pca and new data for Bottle object
Bcomp  =  pca(egBottle);Bcomp  =  Bcomp(:,1:3); NewBottle = (Bcomp(:,1:3)'* egBottle')';

%pca and new data for Glass object
Ctcomp  =  pca(egContainer);Ctcomp  =  Ctcomp(:,1:3); NewCont = (Ctcomp(:,1:3)'* egContainer')';

%pca and new data for Glass object
bcomp  =  pca(egBird);bcomp  =  bcomp(:,1:3); NewBird = (bcomp(:,1:3)'* egBird')';

%pca and new data for Glass object
Icomp  =  pca(egIcecream);Icomp  =  Icomp(:,1:3); NewIcecream = (Icomp(:,1:3)'* egIcecream')';

v1=1;v2=2; v3=3;

%plot scatter on 3-d with 1st eigenvector as Z-axis, 2nd eigenvector as X-axis
% and 3rd eigenvectors as Y-axis 
figure(1)
scatter3(NewGlass(:,v2),NewGlass(:,v3),NewGlass(:,v1),'o'); 
view(-30,20);
hold on
scatter3(NewToy(:,v2),NewToy(:,v3),NewToy(:,v1),'+');
hold on
scatter3(NewBowl(:,v2),NewBowl(:,v3),NewBowl(:,v1),'*');
hold on
scatter3(NewCup(:,v2),NewCup(:,v3),NewCup(:,v1),'s');
hold on
scatter3(NewBottle(:,v2),NewBottle(:,v3),NewBottle(:,v1),'d');
hold on
scatter3(NewCont(:,v2),NewCont(:,v3),NewCont(:,v1),'x');
hold on
scatter3(NewBird(:,v2),NewBird(:,v3),NewBird(:,v1),'>');
hold on
scatter3(NewIcecream(:,v2),NewIcecream(:,v3),NewIcecream(:,v1),'^');
grid off
xlabel('Second eigenvector', 'FontSize', 10);
ylabel('Third eigenvector', 'FontSize', 10);
zlabel('First eigenvector', 'FontSize', 10);


%legend([{'Glass'},{'Toy'},{'Bottle'},{'Bird'},{'Icecream'}])

legend([{'Glass'},{'Toy'},{'Bowl'},{'Cup'},{'Bottle'},{'Can'},{'Bird'},...
        {'Icecream'}])
