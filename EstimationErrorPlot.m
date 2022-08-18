function [mse,R,p,rg] = EstimationErrorPlot(prediction,target)

    mse = mean((target - prediction).^2);
    [R, p] = corr(target, prediction);
    rg = [min([prediction; target]),max([prediction; target])];
end

