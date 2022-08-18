function y = SignalResample(x, xFs, yFs)

% Find the total time duration 'T'
T = (length(x)-1)/xFs;

% Using 'T', define a time vector 'tx'
tx = x(1):1/xFs:T+x(1);

% Using 'T', define the new time vector, 'ty' for our resampled time. 
ty = x(1):1/yFs:T+x(1);

% Use interp1 to create y by resampling x
y = interp1(tx,x,ty);
