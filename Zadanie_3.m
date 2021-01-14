
%% Prepare the data for Training
% Read all images and store them in a 4D uint8 input array for training,
% with its corresponding class
close all; 
clear all;
load('Dane_Uczace.mat');


% XTrain=zeros(4,2500);

YTrain=Yucz(6:2500);
XTrain=zeros(4,2500);
for i=6:2500
 XTrain(:,i)=[Uucz(i-4) Uucz(i-5) Yucz(i-1) Yucz(i-2)];
end;
XTrain=XTrain(:,6:2500);
    
    % lstmLayer(7)

%% Define a CNN architecture
layers = [
    sequenceInputLayer(4)
    fullyConnectedLayer(7)
    fullyConnectedLayer(1)
    regressionLayer];

% Define the training options.
options = trainingOptions('adam', ...
    'MaxEpochs',100, ...
    'WorkerLoad', 4);




%% Training the CNN
[net, info] = trainNetwork(XTrain, YTrain, layers,options);

% Alternative way using imageDataStore
% imdsTrain = imageDatastore(fullfile(pwd,'cifar10Train'),...
%     'IncludeSubfolders',true,'LabelSource','foldernames');
% [net, info] = trainNetwork(imdsTrain, layers, opts);




 Xucz=zeros(4,2500);
%XTest = Uwer;
TTest = Yucz;
YPred=Yucz;

%% Run the network on the test set



numTimeStepsTest =2500;
for i = 6:numTimeStepsTest
    Xucz(:,i)=[Uucz(i-4) Uucz(i-5) YPred(i-1) YPred(i-2)];
    [net,YPred(i)] = predictAndUpdateState(net,Xucz(:,i),'ExecutionEnvironment','cpu');
end
accuracyUcz = sum((YPred-TTest).^2)
plot(Yucz)
hold on;
plot(YPred)
hold off;

%%  Visualise the first layer weights.
%figure;
%montage(mat2gray(gather(net.Layers(2).Weights)));
%title('First Layer Weights');

%% Load Test Data
load('Dane_Weryfikacyjne.mat');


 Xwer=zeros(4,2500);
%XTest = Uwer;
TTest = Ywer;
YPred=Ywer;

%% Run the network on the test set



numTimeStepsTest =2500;
for i = 6:numTimeStepsTest
    Xwer(:,i)=[Uwer(i-4) Uwer(i-5) YPred(i-1) YPred(i-2)];
    [net,YPred(i)] = predictAndUpdateState(net,Xwer(:,i),'ExecutionEnvironment','cpu');
end

% Alternative way using imageDataStore
% imdsTest = imageDatastore(fullfile(pwd, 'cifar10Test'),...
%     'IncludeSubfolders',true,'LabelSource','foldernames');
% YTest = classify(net, imdsTest);

% Calculate the accuracy.
accuracy = sum((YPred-TTest).^2)

plot(Ywer);
hold on;
plot(YPred);
hold off;


