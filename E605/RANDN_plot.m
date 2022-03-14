% RANDN_plot
% This routine plots the results of the RANDN generator in a histogram
% and compares it to a Gaussian distribution

m = 0.0  %set the Gaussian mean
sigma = 1.0  %set the standard deviation
Xmin = -4.0;  Xmax = 4.0;  %set the plotting limits
Dx = 0.1;  %set the bin size
Np = 10000;  %set the number of histogram points

xs = sigma*randn(1,Np) + m;  %calculate the histogram points
bv= Xmin:Dx:Xmax;  %set the plotting limits

% Calculate, plot, and normalize the histogram
nhist = histc(xs,bv);  nhist = nhist/(Dx*Np);
bar(bv,nhist,'histc')

set(gca,'XLim',[Xmin Xmax]) %hold the axes for comparing to a Gaussian
hold on

% Calculate and plot the Gaussian
gauss = (1.0/sqrt(2.0*pi*sigma^2))*exp(-(0.5/sigma^2)*(bv - m).^2);
plot(bv,gauss,'r','LineWidth',4)
hold off

% Calculate the Monte Carlo mean and standard deviation
mMC = (1/Np)*sum(xs),  
VarMC = (1/(Np-1))*sum(xs.^2) - mMC^2;  sigmaMC = sqrt(VarMC)
