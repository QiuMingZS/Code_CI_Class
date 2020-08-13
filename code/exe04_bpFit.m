% using BP network to classify 2 kinds of points, nonlinear
% creator: Guanzheng Wang
% time: 2020.03.10.17.15

%% prepare
clear,clc,close all 
%% input data
X = -1:0.1:1;
D = [-0.9602, -0.5770, -0.0729,  0.3771,  0.6405,  0.6600,  0.4609, ...
      0.1336, -0.2013, -0.4344, -0.5000, -0.3930, -0.1647, -0.0988, ...
      0.3072,  0.3960,  0.3449,  0.1816, -0.3120, -0.2189, -0.3201];
%% show
figure
plot(X, D, 'o')
hold on
%% network design
net = newff([-1, 1], [5, 1], {'tansig', 'tansig'});
net.trainParam.epochs = 100;
net.trainParam.goal = 0.01;
%% training
net = train(net, X, D);
%% test
O = sim(net, X);
plot(X, O, '+')
%% get parameters of the network
V = net.iw{1, 1};
theta1 = net.b{1};
W = net.lw{2, 1};
theta2 = net.b{2};

%% fanhua
X1 = -1: 0.03: 1;
O1 = sim(net, X1);
plot(X1, O1, '*r')








