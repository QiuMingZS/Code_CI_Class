% using BP network to classify 2 kinds of points, nonlinear
% creator: Guanzheng Wang
% time: 2020.03.10.17.15

%% prepare
clear,clc,close all 
%% input vector
P = [-1, -1, 2, 2, 4;   
     0,  5,  0, 5, 7];      % ponits to be classified
%% destination vector
T = [0 0 1 1 0];            % class
%% plot the relationship between P and T
figure('name', 'relationship between P and T')
plotpv(P, T)
%% network design
net = newff(minmax(P), [5, 1], {'tansig', 'purelin'}, 'trainrp');
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
%% network train
[net, tr] = train(net, P, T);
%% network parameter show, if needed
net.iw{1, 1};
net.b{1};
net.iw{2, 1};
net.b{1};
%% test
O = sim(net, P)
%% compare
[T; round(O)]
