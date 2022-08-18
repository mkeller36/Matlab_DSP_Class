Fs = 1000;
freq_range = [100,200];
filt10 = fir1(10,freq_range/(Fs/2));
filt100 = fir1(100,freq_range/(Fs/2));
filt1000 = fir1(1000,freq_range/(Fs/2));

[yfft, f] = myfft(filt10, Fs);
MagnitudeSpectrumPlot(yfft,f)  

[~,i] = min(abs(f-90));
yfft(i)

[yfft, f] = myfft(filt100, Fs);
MagnitudeSpectrumPlot(yfft,f)  

[~,i] = min(abs(f-90));
yfft(i)

[yfft, f] = myfft(filt1000, Fs);
MagnitudeSpectrumPlot(yfft,f)  

[~,i] = min(abs(f-90));
yfft(i)