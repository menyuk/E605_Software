function [zbesp] = ZBesPTab(nu,Nzero)
%ZBesPTab Tabulates the first Nzero zeros of the 
%derivative of the Bessel functions
%   Created by C. Menyuk on 10/07/2009 for ENEE 605
%   This routine calculates the first Nzero zeros of the derivative
%   of the nu-th Bessel function.
%   The argument nu gives the order of the Bessel function

bessjpnu = @(x) 0.5*(besselj(nu-1,x) - besselj(nu+1,x));
k=1; x=0.001;
while k <= Nzero,
    if (bessjpnu(x)*bessjpnu(x+3) < 0)
        zbesp(k) = fzero(bessjpnu,[x x+3]);
        k = k+1;
    end    
    x = x+3;
end

end