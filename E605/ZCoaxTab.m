function [zbes] = ZCoaxTab(nu,Nzero,rho)
%ZCoaxTab Tabulates the first Nzero zeros of the 
%Bessel function combination 
%J_nu(rho*x)Y_nu(x) - J_nu(x)Y_nu(rho*x)
%   Created by C. Menyuk on 11/02/2009 for ENEE 605 PS2, no. 5
%   nu = Bessel function order
%   Nzero = number of zeros found
%   rho = ratio of the inner and outer diameters

besscnu = @(x) besselj(nu,rho*x)*bessely(nu,x)...
    -besselj(nu,x)*bessely(nu,rho*x);
k=1; x=0.001;
while k <= Nzero,
    if (besscnu(x)*besscnu(x+3) < 0)
        zbes(k) = fzero(besscnu,[x x+3]);
        k = k+1;
    end    
    x = x+3;
end

end