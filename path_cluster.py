from __future__ import division

import networkx as nx
import pylab as pb

rho=file('CLphd.txt','w')
N=1000
k=10
prob=[0,0.00025,0.000375,0.0005,0.000625,0.00075,0.000875,0.001,0.002,0.003,0.004,0.005,0.006,0.007,0.008,0.009,0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.70,0.75,0.8,0.85,0.9,0.95,1]

C=[]
L=[]

niter=50
for p in prob:
    s1=0
    s2=0
    for j in range(niter):
        g2=nx.connected_watts_strogatz_graph(N, k, p)
	av=nx.average_clustering(g2)
	ap=nx.average_shortest_path_length(g2)
	s1=s1+av/niter
	s2=s2+ap/niter
    C.append(s1)
    L.append(s2)
Cp=[n/C[0] for n in C]    
Lp=[n1/L[0] for n1 in L]    
for i in Cp:
    print >> rho, i,
print >> rho, ''
for j in Lp:
    print >> rho, j,
rho.close()
pb.figure(2)
pb.semilogx(prob,Cp,'s')
pb.semilogx(prob,Lp,'o')
pb.xlabel('p')
pb.show()
