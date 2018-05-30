%PCA analysis

%compute feature vector of laplacian eigenvalues for the objects
s = 6;                                                                %size of the leading eigenvalues
egGlass     = computeFeatureVecNorm(s,'glass/obj18__','.png',70,4,3);%compute feature vector for each of the eight objects
egToy       = computeFeatureVecNorm(s,'toys/obj48__','.png',70,4,4); 
egBowl      = computeFeatureVecNorm(s,'bowls/obj25__','.png',30,5,4);
egCup       = computeFeatureVecNorm(s,'cups/obj11__','.png',30, 8,7);
egBottle    = computeFeatureVecNorm(s,'bottles/obj50__','.png',70,3,3);
egContainer = computeFeatureVecNorm(s,'container/obj70__','.png',70, 3, 5);
egBird      = computeFeatureVecNorm(s,'birds/obj74__','.png',30, 4, 4);
egIcecream  = computeFeatureVecNorm(s,'icecream/obj72__','.png',50, 4,3);

Data = [egGlass egToy egBowl egCup egBottle egContainer egBird egIcecream]; 

glassCov = egGlass*egGlass'; 
toyCov   = egToy*egToy';
bowlCov  = egBowl*egBowl';
cupCov   = egCup*egCup';
bottleCov= egBottle*egBottle';
contCov  = egContainer*egContainer';
birdCov  = egBird*egBird';
iceCov   = egIcecream*egIcecream';

totCov = (1/8)*(glassCov+toyCov+bowlCov+cupCov+bottleCov+contCov+birdCov+iceCov);

[V,D] = eig(totCov);

NewData = D^(-0.5) * V' * Data;

NewVec = pca(NewData');

Result = NewVec(:,1:3)'* Data;

NewGlass = Result(:,1:72);                                                  %slice mapped graphs for individual images so as to have different colours for each image
NewToy   = Result(:,73:144);
NewBowl  = Result(:,145:216);
NewCup   = Result(:,217:288);
NewBottle = Result(:,289:360);
NewCont   = Result(:,361:432);
NewBird   = Result(:,433:504);
NewIcecream   = Result(:,505:576);

v1=1;v2=2; v3=3;                                                           % indices for axes

%plot scatter on 3-d with 1st eigenvector as Z-axis, 2nd eigenvector as X-axis
% and 3rd eigenvectors as Y-axis 
figure(1)
scatter3(NewGlass(v2,:),NewGlass(v3,:),NewGlass(v1,:),'o'); 
% view(-30,20);
hold on
scatter3(NewToy(v2,:),NewToy(v3,:),NewToy(v1,:),'+');
hold on
scatter3(NewBowl(v2,:),NewBowl(v3,:),NewBowl(v1,:),'*');
hold on
scatter3(NewCup(v2,:),NewCup(v3,:),NewCup(v1,:),'s');
hold on
scatter3(NewBottle(v2,:),NewBottle(v3,:),NewBottle(v1,:),'d');
hold on
scatter3(NewCont(v2,:),NewCont(v3,:),NewCont(v1,:),'x');
hold on
scatter3(NewBird(v2,:),NewBird(v3,:),NewBird(v1,:),'>');
hold on
scatter3(NewIcecream(v2,:),NewIcecream(v3,:),NewIcecream(v1,:),'^');
grid off
% axis([-15 10 -5 10 -5 5]);
xlabel('First eigenvector', 'FontSize', 10);
ylabel('Second eigenvector', 'FontSize', 10);
zlabel('Third eigenvector', 'FontSize', 10);