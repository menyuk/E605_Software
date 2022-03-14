function [zbesp] = ZCoaxPTab(nu,Nzero,rho)
%ZCoaxPTab Tabulates the first Nzero zeros of the 
%combination of derivatives of the Bessel functions 
%J_nu'(rho*x)Y_nu'(x) - J_nu'(x)Y_nu'(rho*x)
%   Created by C. Menyuk on 11/02/2009 for ENEE 605 PS2, no. 5
%   nu = Bessel function order
%   Nzero = number of zeros found
%   rho = ratio of the inner and outer diameters

besscpnu = @(x) (besselj(nu-1,rho*x) - besselj(nu+1,rho*x))...
    * (bessely(nu-1,x) - bessely(nu+1,x))...
    - (besselj(nu-1,x) - besselj(nu+1,x))...
    * (bessely(nu-1,rho*x) - bessely(nu+1,rho*x));
k=1; x=0.001;
while k <= Nzero,
    if (besscpnu(x)*besscpnu(x+3) < 0)
        zbesp(k) = fzero(besscpnu,[x x+3]);
        k = k+1;
    end    
    x = x+3;
end

end