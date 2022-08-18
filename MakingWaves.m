% Define T, Fs, and f (vector of sound frequencies)
T = 3;
Fs = 44100;
f = [330 247 208 165 123 82];
a = (2*pi*f)';

% Compute time vector, t
t = [0:1/Fs:T];
t(end) = [];

% Use a for-loop to construct y as a sum of cosines
y = cos(a*t);
y = sum(y);
soundsc(y,Fs)
