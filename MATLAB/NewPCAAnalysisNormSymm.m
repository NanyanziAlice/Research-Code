%PCA analysis based on leading eigenvalues of Normalised Laplacian %%%%%%


% arguments to the computeFeatureVecNorm() function %%%%%%%%
%first  : s is the number of the leading eigenvalues
%second  : directory of object/image
%third  : image type
%forth  : number of points/vertices of Delanay graph
%fifth&sixth  : cordinates of the extreme corner points to be deleted

s = 6;                                                                %size of the leading eigenvalues
egGlass     = computeFeatVecNormSymm(s,'glass/obj18__','.png',90,4,3); %compute feature vector for each of the eight objects
egToy       = computeFeatVecNormSymm(s,'toys/obj48__','.png',55,4,4); 
egBowl      = computeFeatVecNormSymm(s,'bowls/obj25__','.png',150,5,4);
egCup       = computeFeatVecNormSymm(s,'cups/obj11__','.png',40, 8,7);
egBottle    = computeFeatVecNormSymm(s,'bottles/obj50__','.png',40,3,3);
egContainer = computeFeatVecNormSymm(s,'container/obj70__','.png',70, 3, 5);
egBird      = computeFeatVecNormSymm(s,'birds/obj74__','.png',60, 4, 4);
egIcecream  = computeFeatVecNormSymm(s,'icecream/obj72__','.png',80, 4,3);

% Building the data matrix S where each column is the feature vector of
% respective graph G_k

S = [egGlass egToy egBowl egCup egBottle egContainer egBird egIcecream]; 

St = S';                              % transpose matrix so that obsercvations as rows a dimensions are ccolumns
Smm =  St - mean(St);                 % normalise data by subtracting the mean                                               
V = pca(St);                          % perform pca on raw data;  pca first normalises the data 
Vs = V(:,1:3);                        % select the first 3 principal components
B_new = Vs'* Smm';                    % new data as mapped to the principal components


%slice mapped graphs for different images of each of the 8 objects so as to have different colours for each image
NewGlass     = B_new(:,1:72);             
NewToy       = B_new(:,73:144);
NewBowl      = B_new(:,145:216);
NewCup       = B_new(:,217:288);
NewBottle    = B_new(:,289:360);
NewCont      = B_new(:,361:432);
NewBird      = B_new(:,433:504);
NewIcecream  = B_new(:,505:576);


v1=3;v2=1; v3=2;

%plot scatter on 3-d with 1st eigenvector as Z-axis, 2nd eigenvector as X-axis
% and 3rd eigenvectors as Y-axis 

figure(1)
scatter3(NewGlass(v2,:),NewGlass(v3,:),NewGlass(v1,:),'o','MarkerEdgeColor',[0.2 0.65 0.5]); 
% view(-30,20);
hold on
scatter3(NewToy(v2,:),NewToy(v3,:),NewToy(v1,:),'+','MarkerEdgeColor',[0 1 0]);
hold on
scatter3(NewBowl(v2,:),NewBowl(v3,:),NewBowl(v1,:),'*','MarkerEdgeColor',[0 0 1]);
hold on
scatter3(NewCup(v2,:),NewCup(v3,:),NewCup(v1,:),'s','MarkerEdgeColor',[0 0.95 0.95]);
hold on
scatter3(NewBottle(v2,:),NewBottle(v3,:),NewBottle(v1,:),'d','MarkerEdgeColor',[0.75 0 0.75]);
hold on
scatter3(NewCont(v2,:),NewCont(v3,:),NewCont(v1,:),'V','MarkerEdgeColor',[0.95 0.97 0.1]);
hold on
scatter3(NewBird(v2,:),NewBird(v3,:),NewBird(v1,:),'*','MarkerEdgeColor',[1 0 0]);
hold on
scatter3(NewIcecream(v2,:),NewIcecream(v3,:),NewIcecream(v1,:),'^','MarkerEdgeColor',[0 0 0]);
grid off
xlabel('First eigenvector', 'FontSize', 10);
ylabel('Second eigenvector', 'FontSize', 10);
zlabel('Third eigenvector', 'FontSize', 10);
%legend('Glass','Toy','Bowl','Cup','Bottle','Container','Birds', 'Icecream')
legend('object1','object2','object3','object4','object5','object6','object7', 'object8')