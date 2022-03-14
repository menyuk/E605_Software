function [zbes] = ZBesTab(nu,Nzero)
%ZBesTab Tabulates the first Nzero zeros of the 
%Bessel functions
%   Created by C. Menyuk on 10/07/2009 for ENEE 605
%   This routine calculates the first Nzero zeros of the nu-th
%   Bessel function.
%   The argument nu gives the order of the Bessel function

bessjnu = @(x) besselj(nu,x);
k=1; x=0.001;
while k <= Nzero,
    if (bessjnu(x)*bessjnu(x+3) < 0)
        zbes(k) = fzero(bessjnu,[x x+3]);
        k = k+1;
    end    
    x = x+3;
end

end