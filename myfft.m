function [yfft, f] = myfft(y,Fs)
%compute the standard fft
yfft = fft(y);
%trim away the redundant part
yfft = yfft(1:ceil((length(y)+1)/2));
%compute the frequencies to which each fft entry corresponds.
sampnum = [0:(length(yfft)-1)]';
f = sampnum*Fs/length(y);