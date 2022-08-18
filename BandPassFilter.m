function y = BandPassFilter(x, Fs, freq_range, W)
    %Create the filter using 'fir1'
    filter = fir1(W, freq_range/(Fs/2));
    %Apply the filter using 'conv'
    y = conv(x,filter,'same');
    
