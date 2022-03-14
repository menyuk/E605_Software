function[] = DispExample(N)
%
% This routine plots modulated wave functions.
% Created by C. R. Menyuk for CMPE 471, 10/11/2009
% N = number of cosine contributions

TWINDOW = 10.0;  %limits of the time window
FREQ = 4.0;      %carrier frequency
DF = 0.1;        %the frequency spacing between comb lines
SIGMA = 0.3;     %the standard deviation of an approximately
                 %Gaussian distribution

t = -TWINDOW:0.01:TWINDOW;
wcar = cos(2.0*pi*FREQ*t);

if (N == 1) wmod = ones(size(t));
elseif (N == 2) wmod = cos(2.0*pi*DF*t);
else
    wmod = 0.5*ones(size(t));
    for l = 2:N, 
        wmod = wmod + exp(-((l-1)*DF)^2/(2.0*SIGMA^2))...
            *cos(2.0*pi*(l-1)*DF*t);
    end
end
y = wmod.*wcar;
plot(t,y)
if (N > 0) 
    line(t,wmod,'Linewidth',1,'Color','r')
    line(t,-wmod,'Linewidth',1,'Color','r')
figure(1)
end