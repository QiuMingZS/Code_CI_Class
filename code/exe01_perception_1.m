% a simple perception example using Neural Network
% creator: Guanzheng Wang
% time: 2020.03.01.14.43

%% prepare
clear,clc,close all 

%% input vector
P = [-0.5, -0.5, +0.3, +0.3;
     -0.5, +0.5, -0.5, +1.0];
%% destination vector
T = [1, 1, 0, 0];
%% plot the relationship between P and T
figure('name', 'relationship between P and T')
plotpv(P, T)
%% define and initialize a perceptor
net = newp([-0.5, 0.5; -0.5, 1], 1);
net = init(net);
net.b{1} = [-0.1680];
net.iw{1, 1} = [0.8161, 0.3078];
%% plot initialized perceptor
plotpc(net.iw{1, 1}, net.b{1})
%% train the network
[net, tr, Y, error] = train(net, P, T);
%% plot the result of training
figure('name', 'training result')
plotpv(P, T)
plotpc(net.iw{1, 1}, net.b{1});
%% test the trained network
p = [0.31; 0.9];
a = sim(net, p)



