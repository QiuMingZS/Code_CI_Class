% build a competive network
% creator: Guanzheng Wang
% time: 2020.03.10.18.32

%% prepare
clear,clc,close all 

%% creat inputs X
bounds = [-1, 1; -1, 1];
clusters = 4;
points = 20;
std_dev = 0.05;
x = nngenc(bounds, clusters, points, std_dev);
%% plot x
plot(x(1,:), x(2,:), '+b')
title('Input Vectors')
xlabel('x(1)')
ylabel('x(2)')
%% competitive network design
net = competlayer(4, 0.1);
net = configure(net, x);
w = net.IW{1};
hold on 
circles = plot(w(:,1), w(:,2), 'og');
net.trainParam.epochs = 500;
%% train the network
net = train(net, x);
w = net.IW{1};
hold on 
plot(w(:,1), w(:,2), 'or');
%% test
outputs = net(x);
classes = vec2ind(outputs);


