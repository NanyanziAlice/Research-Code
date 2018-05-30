
%PCA analysis

%compute feature vector of laplacian eigenvalues for the objects
s = 6;                                                                %size of the leading eigenvalues
egGlass     = computeFeatureVector(s,'glass/obj18__','.png',90,4,3); %compute feature vector for each of the eight objects
egToy       = computeFeatureVector(s,'toys/obj48__','.png',55,4,4); 
egBowl      = computeFeatureVector(s,'bowls/obj25__','.png',150,5,4);
egCup       = computeFeatureVector(s,'cups/obj11__','.png',40, 8,7);
egBottle    = computeFeatureVector(s,'bottles/obj50__','.png',40,3,3);
egContainer = computeFeatureVector(s,'container/obj70__','.png',70, 3, 5);
egBird      = computeFeatureVector(s,'birds/obj74__','.png',60, 4, 4);
egIcecream  = computeFeatureVector(s,'icecream/obj72__','.png',80, 4,3);


S = [egGlass egToy egBowl egCup egBottle egContainer egBird egIcecream];    % form a combined data matrix where each column is eigenvalue feature vector of each graph
St = S';                                                                    % transpose matrix so that obsercvations ae rows a dimensins are cccolumns
Smm =  St - mean(St);                                                       % normalise data by subtracting the mean                                               
V = pca(St);                                                                % perform pca on raw data;  pca first normalises the data 
Vs = V(:,1:3);                                                              % select the first 3 principal compoeents
B_new = Vs'* Smm';                                                          % new data as mapped to the principal components

NewGlass = B_new(:,1:72);                                                  %slice mapped graphs for individual images so as to have different colours for each image
NewToy   = B_new(:,73:144);
NewBowl   = B_new(:,145:216);
NewCup    = B_new(:,217:288);
NewBottle = B_new(:,289:360);
NewCont   = B_new(:,361:432);
NewBird   = B_new(:,433:504);
NewIcecream   = B_new(:,505:576);
v1=1;v2=2; v3=3;

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
xlabel('Second eigenvector', 'FontSize', 10);
ylabel('Third eigenvector', 'FontSize', 10);
zlabel('First eigenvector', 'FontSize', 10);