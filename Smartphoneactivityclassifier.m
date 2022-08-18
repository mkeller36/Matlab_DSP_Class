clc
clear

load humanactivity.mat
D_train = feat(1:2:end,:);
class_train = actid(1:2:end);
D_test = feat(2:2:end,:);
class_test = actid(2:2:end);

% Use your my_fitpca function create a classification model with the training set.
mdl = my_fitpca(D_train,class_train);
testMDL = my_fitpca(D_test,class_test);
% Use your classification model with your my_predictpca function to estimate classifications on the testing set
cls = my_predictpca(mdl, D_test);

accuracy = sum(cls == class_test)/length(class_test)*100;
fprintf('%.2f Accuracy \n', accuracy);