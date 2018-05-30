

%L = [2 -1 0 -1; -1 3 -1 -1; 0 -1 1 0; -1 -1 0 2];
Ln =[1 -0.4082 0 -0.5; -0.4082 1 -0.5774 -0.4082; 0 -0.5774 1 0; -0.5 -0.4082 0 1];
[V,D_h] = eig(Ln);
I = eye(4);
P = I-Ln;
[V1,D2] = eig(P); 

A  = [0 1 1 0; 1 0 1 1; 1 1 0 0; 0 1 0 0];
L1 = diag(sum(A))-A;
An = [0 0.4083 0.5 0; 0.4083 0 0.4083 0.5774; 0.5 0.4083 0 0; 0 0.5774 0 0];
Aex = expm(A);
Anex = expm(An);

%% checking heat content normal Laplacian%%%%%%
L =[2 -1 -1 0; -1 3 -1 -1; -1 -1 2 0; 0 -1 0 1];
time = linspace(0,4,9);
lst = zeros(4,4);
leg_lst = strings([1,4]);
c=1;
for t = time
    lst(c,:) = diag(expm(-t*L));
    leg_lst(1,c)= strcat('Node',num2str(c));
    c = c+1;
end
plot(time , lst(:,2:end));
legend([{'Node 2'},{'Nodes 1,3'},{'Node 4'}]);

%% heatkernel with Normalised Laplacian %%%%%%
Lm = [1 -0.5 -0.7071 0; -0.5 1 0 -0.7071; -0.7071 0 1 0; 0 -0.7071 0 1];
[Vn,Dn] = eig(Lm);
hn_0 = expm(0*Lm);
hn_1 = expm(-1*Lm);
hn_2 = expm(-2*Lm);
hn_3 = expm(-3*Lm);
hn_4 = expm(-4*Lm);

%% heat kernel mellin= 3 %%%%%
LG = [2.125 -1 -1 -0.125; -1 3 -1 -1; -1 -1 2.125 -0.125; -0.125 -1 -0.125 1.25];
time = linspace(0,4,9);
lst = zeros(4,4);
leg_lst = strings([1,4]);
c=1;
for t = time
    lst(c,:) = diag(expm(-t*LG));
    leg_lst(1,c)= strcat('Node',num2str(c));
    c = c+1;
end
plot(time , lst(:,2:end));
legend([{'Node 2'},{'Nodes 1,3'},{'Node 4'}]);

%% heat kernel for Mellin s=2 %%%%
LG2 = [2.5 -1 -1 -0.5; -1 3 -1 -1; -1 -1 2.5 -0.5; -0.5 -1 -0.5 2.0];
time = linspace(0,4,9);
lst = zeros(4,4);
leg_lst = strings([1,4]);
c=1;
for t = time
    lst(c,:) = diag(expm(-t*LG2));
    leg_lst(1,c)= strcat('Node',num2str(c));
    c = c+1;
end
plot(time , lst(:,2:end));
legend([{'Node 2'},{'Nodes 1,3'},{'Node 4'}]);


%% heat kernellaplace,lam=2%%%%%%
LGl2 = [2.0183 -1 -1 -0.0183; -1 3 -1 -1; -1 -1 2.0183 -0.0183; -0.0183 -1 -0.0183 1.0366];
time = linspace(0,4,9);
lst = zeros(4,4);
leg_lst = strings([1,4]);
c=1;
for t = time
    lst(c,:) = diag(expm(-t*LGl2));
    leg_lst(1,c)= strcat('Node',num2str(c));
    c = c+1;
end
plot(time , lst(:,2:end));
legend([{'Node 2'},{'Nodes 1,3'},{'Node 4'}]);

%% heat kernel laplace,lam=3%%%%%%
LGl3 = [2.0025 -1 -1 -0.0025; -1 3 -1 -1; -1 -1 2.0025 -0.0025; -0.0025 -1 -0.0025 1.005];
time = linspace(0,4,9);
s = size(time);
lst = zeros(4,4);
leg_lst = strings([1,4]);
c=1;
for t = time
    lst(c,:) = diag(expm(-t*LGl3));
    leg_lst(1,c)= strcat('Node',num2str(c));
    c = c+1;
end
plot(time , lst(:,2:end));
legend([{'Node 2'},{'Nodes 1,3'},{'Node 4'}]);

%% 

v = diag(LG);
D = diag(v);
D_h = D^(-1/2);
L_nom = D_h *LG *D_h;
[Vnorm, Dnorm] = eig(L_nom);
hG_0 = expm(0*L_nom);
hG_1 = expm(-1*L_nom);
hG_2 = expm(-2*L_nom);
hG_3 = expm(-3*L_nom);

LB = [3 -1 -1 -1 0 0 0 0 0; -1 4 -1 -1 -1 0 0 0 0; -1 -1 3 -1 0 0 0 0 0;
      -1 -1 -1 3 0 0 0 0 0; 0 -1 0 0 2 -1 0 0 0; 0 0 0 0 -1 4 -1 -1 -1;
      0 0 0 0 0 -1 3 -1 -1; 0 0 0 0 0 -1 -1 3 -1; 0 0 0 0 0 -1 -1 -1 3];
hb_0 = expm(0*LB);
hb_1 = expm(-1*LB);
hb_2 = expm(-2*LB);
hb_3 = expm(-3*LB);

%% checking heat content per row or colum normal Laplacian%%%%%%
L =[2 -1 -1 0; -1 3 -1 -1; -1 -1 2 0; 0 -1 0 1];
time = linspace(0,4,9);
lst = zeros(4,4);
leg_lst = strings([1,4]);
c=1;
for t = time
    lst(c,:) = sum(expm(-t*L));
    leg_lst(1,c)= strcat('Node',num2str(c));
    c = c+1;
end
plot(time , lst(:,2:end));
legend([{'Node 2'},{'Nodes 1,3'},{'Node 4'}]);

%% heat kernel per row or per column mellin= 3 %%%%%
LG = [2.125 -1 -1 -0.125; -1 3 -1 -1; -1 -1 2.125 -0.125; -0.125 -1 -0.125 1.25];
time = linspace(0,4,9);
lst = zeros(4,4);
leg_lst = strings([1,4]);
c=1;
for t = time
    lst(c,:) = sum(expm(-t*LG));
    lst(c,:)
    leg_lst(1,c)= strcat('Node',num2str(c));
    c = c+1;
end
plot(time , lst(:,2:end));
legend([{'Node 2'},{'Nodes 1,3'},{'Node 4'}]);

%% heat kernel for normalised laplacian %%%%%
LG = [1 -0.4082 -0.5 -0.7071; -0.4082 1 -0.4082 -0.5774; -0.5 -0.4082 1 -0.7071; -0.7071 -0.5774 -0.7071 1];
time = linspace(0,4,9);
lst = zeros(4,4);
leg_lst = strings([1,4]);
c=1;
for t = time
    lst(c,:) = diag(expm(-t*LG));
    lst(c,:)
    leg_lst(1,c)= strcat('Node',num2str(c));
    c = c+1;
end
plot(time , lst(:,2:end));
legend([{'Node 2'},{'Nodes 1,3'},{'Node 4'}]);

%% heat kernel for normalised laplacian %%%%%
LG = [1 -0.4082 -0.5 -0.7071; -0.4082 1 -0.4082 -0.5774; -0.5 -0.4082 1 -0.7071; -0.7071 -0.5774 -0.7071 1];
time = linspace(0,4,9);
lst = zeros(4,4);
leg_lst = strings([1,4]);
c=1;
for t = time
    lst(c,:) = sum(expm(-t*LG));
    leg_lst(1,c)= strcat('Node',num2str(c));
    c = c+1;
end
plot(time , lst(:,2:end));
legend([{'Node 2'},{'Nodes 1,3'},{'Node 4'}]);
