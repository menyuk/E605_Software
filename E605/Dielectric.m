% Dielectric
%
% This routine calculates and plots the dielectric function and
% its inverse for a simple exponential function and its inverse
% Written Sept. 7, 2009 for ENEE 605

alpha =1;         %the exponentiation factor
T = 10/alpha;     %the total time interval
Delta = 0.1;      %the interval between time points
N = 1 + T/Delta;  %the matrix dimension
eps0 = 1.0;       %the instantaneous response factor
eps1 = 1.0;       %the delayed response factor

clear eps eta;   %the dielectric matrix and its inverse

%Set up the diagonal
eps = eps0*eye(N);

%Set up the exponential contribution
t = 0:N-1; t = Delta*t;  V = eps1*Delta*exp(-alpha*t);

%Fill the matrix with the appropriate elements
for n = 1:N
    eps = eps + diag(ones([1 N-n+1])*V(n),n-1);
end

%Calculate the inverse
eta = inv(eps);

%plotting routines
if eps0 > 1e-6
    REM = - eta(1,:)/Delta;
    REM(1) = REM(1) + 1.0/(Delta*eps0);
else
    REM = - eta(1,:)/Delta;
    REM(1) = REM(1) - alpha/(eps1*Delta) + 1.0/(eps1*Delta^2);
    REM(2) = REM(2) - 1.0/(eps1*Delta^2);
end
plot(t,REM)
hold on