
%compute feature vector of laplacian eigenvalues for the objects
s =[1,2,3,4];                                                              %size of the leading eigenvalues
egGlass     = computeFeatureVectorZeta(s,'glass/obj18__','.png',70,4,3);   %compute feature vector for each of the eight objects
egToy       = computeFeatureVectorZeta(s,'toys/obj48__','.png',70,4,4); 
egBowl      = computeFeatureVectorZeta(s,'bowls/obj25__','.png',30,5,4);
egCup       = computeFeatureVectorZeta(s,'cups/obj11__','.png',30, 8,7);
egBottle    = computeFeatureVectorZeta(s,'bottles/obj50__','.png',70,3,3);
egContainer = computeFeatureVectorZeta(s,'container/obj70__','.png',70,3,5);
egBird      = computeFeatureVectorZeta(s,'birds/obj74__','.png',30, 4, 4);
egIcecream  = computeFeatureVectorZeta(s,'icecream/obj72__','.png',50, 4,3);

S = [egGlass egToy egBowl egCup egBottle egContainer egBird egIcecream];   % combine individual feature vectors into abig dataset
St = S';                                                                   % transpose dataset so that observations are rows
%St = St - mean(St);                                                        % subtract mean of each column from each element of the column
%S_mn = St';                                                                % transform back the matrix
%Cov = S_mn*St;                                                             % compute covariance matrix                                                            
%[V,D] = eig(Cov);                                                          % compute eigenvectors and eigenvalues of covariance matrix
%Vs = fliplr(V(:,end-2:end));                                               % select 3 principal components and reverse the order so the one with largest eigenvalue comes first
%B_new = Vs'* S_mn;                                                         % project graphs onto eigenspace
% Vs = pca(St);
% Vs = Vs(:,1:3);
% B_new = Vs'* St';
Sm = St - mean(St);  
V = pca(St);
Vs = V(:,1:3); 
B_new = Vs'* S;

NewGlass = B_new(:,1:72);                                                  %slice mapped graphs for individual images so as to have different colours for each image
NewToy   = B_new(:,73:144);
NewBowl  = B_new(:,145:216);
NewCup   = B_new(:,217:288);
NewBottle = B_new(:,289:360);
NewCont   = B_new(:,361:432);
NewBird   = B_new(:,433:504);
NewIcecream   = B_new(:,505:576);

v1=3;v2=1; v3=2;                                                           % indices for axes

%plot scatter on 3-d with 1st eigenvector as Z-axis, 2nd eigenvector as X-axis
% and 3rd eigenvectors as Y-axis 
figure(1)
scatter3(NewGlass(v2,:),NewGlass(v3,:),NewGlass(v1,:),'o'); 
view(-30,30);
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
%axis([-5*10^6 15*10^6 -2*10^4 2*10^4 -200 500]);
xlabel('First eigenvector', 'FontSize', 10);
ylabel('Second eigenvector', 'FontSize', 10);
zlabel('Third eigenvector', 'FontSize', 10);

