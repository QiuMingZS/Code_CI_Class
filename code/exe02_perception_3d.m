% a simple perception example using Neural Network
% in order to classify points in 3 dimensions
% creator: Guanzheng Wang
% time: 2020.03.02.20.15

%% prepare
clear,clc,close all 

%% input vector
P = [-1, +1, -1, +1, -1, +1, -1, +1;
     -1, -1, +1, +1, -1, -1, +1, +1;
     -1, -1, -1, -1, +1, +1, +1, +1];
%% destination vector
T = [0, 1, 0, 0, 1, 1, 0, 1];
%% plot the relationship between P and T
figure('name', 'relationship between P and T')
plotpv(P, T)
%% define and initialize a perceptor
net = newp([-1, 1; -1, 1; -1, 1], 1);
net = init(net);
net.b{1} = [0.2];
net.iw{1, 1} = [-1, -1, 0.8];
%% plot initialized perceptor
plotpc(net.iw{1, 1}, net.b{1})
%% train the network
[net, tr, Y, error] = train(net, P, T);
%% plot the result of training
figure('name', 'training result')
plotpv(P, T)
plotpc(net.iw{1, 1}, net.b{1});
%% test the trained network
p = [0.31; 0.9; 0.5];
a = sim(net, p)

%%


