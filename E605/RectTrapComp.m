%RectTrapComp
%This routine compares the error in the rectangular and trapezoidal
%integrations of $\exp[-(1+j)t]$.
%Written on 09/09/2009 for ENEE 605, Problem Set 1

Tint = 13.6;      %integration interval
EDT = 1:0.01:7;  %exponent of the Delta-t values
DT = 10.^(-EDT);  %values of Delta-t

zarg = (1+1j)*DT;    %argument of the exponential integrand
zval = exp(-zarg);  %exponential integrand
zdif = zarg.*(1-(1/2)*zarg.*(1-(1/3)*zarg.*(1-(1/4)*zarg...
       .*(1-(1/5)*zarg.*(1-(1/6)*zarg.*(1-(1/7)*zarg...
       .*(1-(1/8)*zarg.*(1-(1/9)*zarg.*(1-(1/10)*zarg)))))))));
   %evaluation of $1-\exp[-(1+j)\Delta t]$
   
%Evaluation of the integrals and the errors
Irect = DT.*(1 - exp(-(1+1j)*Tint - zarg))./zdif;
Itrap = 0.5*(1+zval).*Irect;
ErrRect = abs(Irect - 0.5*(1-1j));  %Rectangle rule error
ErrTrap = abs(Itrap - 0.5*(1-1j));  %Trapezoidal rule error

loglog(DT,[ErrRect;ErrTrap]','Linewidth',2.0)
set(gca,'XDir','reverse','LineWidth',1.0,'TickLength',[0.02 0.05])