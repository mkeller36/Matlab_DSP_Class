function MagnitudeSpectrumPlot(yfft, f, col)
    if nargin < 3
        col = 'b';
    end
    plot(f, abs(yfft), col);
    xlabel('Frequency')
    ylabel('|Y(f)|')
end
