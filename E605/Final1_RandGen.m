% Final1_RandGen
%
% This routine generates estimates and histograms for a, b, and c
% in a polynomial fit of a + b*x + c*x^2

N = 1001     % number of x-samples
M = 10000     % number of realizations

x = linspace(0,1,N);  x = x';  %array of x-values

% Set up the "actual" a, b, and c
a = 1.0 + 0.1*randn(N,M);
b = 1.0 + 0.1*randn(N,M);
c = 1.0 + 0.1*randn(N,M);

% Set up the arrays y and A
x1 = repmat(x,1,M);
y = a + b.*x1 + c.*x1.^2;
A = [x.^0 x x.^2];

% Compute least square estimates, their average, and their standard
% deviations
lse = A\y;
avg = sum(lse,2)/M
sm = repmat(avg,1,M); sm = (lse - sm).^2;
variance = sum(sm,2)/(M-1);  sigma = sqrt(variance)

% Calculate expected error at the 75% and 90% confidence levels
err75 = sqrt(2)*erfinv(0.75)*sigma,  err90 = sqrt(2)*erfinv(0.9)*sigma

% Plot probability histograms
nbin = 25;
subplot(1,3,1)
[h,c]=hist(lse(1,:),nbin);  
xc=c(2)-c(1);  h=h/(M*xc);  bar(c,h)
axis([0.95 1.05 0.0 40.0]);
xd=0.95:0.001:1.05; g=normpdf(xd,avg(1),sigma(1));
line(xd,g,'Linewidth',2,'Color','r')
subplot(1,3,2)
[h,c]=hist(lse(2,:),nbin);  
xc=c(2)-c(1);  h=h/(M*xc);  bar(c,h)
axis([0.8 1.2 0.0 8.0]); 
xd=0.8:0.005:1.2; g=normpdf(xd,avg(2),sigma(2));
line(xd,g,'Linewidth',2,'Color','r') 
subplot(1,3,3)
[h,c]=hist(lse(3,:),nbin);
xc=c(2)-c(1);  h=h/(M*xc);  bar(c,h)
axis([0.8 1.2 0.0 8.0]);  
xd=0.8:0.005:1.2; g=normpdf(xd,avg(3),sigma(3));
line(xd,g,'Linewidth',2,'Color','r')  
