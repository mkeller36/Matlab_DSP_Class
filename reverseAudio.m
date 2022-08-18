T = (length(y_rev)-1)/Fs;
t = [0:1/Fs:T];
y = y_rev(end:-1:1)';
soundsc(y,Fs);