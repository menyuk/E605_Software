% Final1_DetGen.m
%
% This routine generates the standard deviations for the expected values 
% of a, b, and c in a polynomial fit of a + b*x + c*x^2

N = 501;        % number of x-samples
VarABC = 0.0025;   % variance of the a, b, c inputs

% Set up the basic vectors
x = linspace(0,1,N);  A = [x'.^0  x'  x'.^2];

% Calculate the reduced QR decomposition
[Q R] = qr(A,0);  Rinv = inv(R);

% Calculate the extend Q-matrix
xe = repmat(x,3,1);  %extended x-vector
Qe = [Q' Q'.*xe  Q'.*xe.^2];  %extended Q-matrix

% Calculate the covariance matrix for the expected values
COV = VarABC*Rinv*Qe*Qe'*Rinv';

% Calculate the standard deviation
sigma = diag(COV);  sigma=sqrt(sigma)