clc
clear

load carbig
D = [Acceleration, Cylinders, Displacement, Horsepower, Model_Year, Weight];
y = MPG;
msk = ~ismissing(y);
D = D(msk,:);
y = y(msk);


D_train  = D(1:2:end,:);
y_train = y(1:2:end);

D_test = D(2:2:end,:);
y_test = y(2:2:end);
rng(0);

mdl = fitrgp([D_train; D_test],[y_train; y_test], 'FitMethod', 'sr', 'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName','expected-improvement-plus'));
pdct = predict(mdl,D_test);
[mse,R,p,rg] = EstimationErrorPlot(pdct,y_test)