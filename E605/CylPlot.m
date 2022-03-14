% CylPlot
%
% This routine plots TM and TE modes in a cylindrical waveguide.
% Written for ENEE 605 by C. R. Menyuk, October 12, 2009

I_TMorTE = 1;  %equals 0 for TM modes; equals 1 for TE modes
M = 10;  N = 2; %mode numbers (>= 1)

close all

theta = 0:0.01:1.0;  theta = 2*pi*theta;
rho = 0:0.01:1.0;
Theta = theta'*ones(size(rho));
Rho = ones(size(theta))'*rho;
[X Y] = pol2cart(Theta, Rho);
if (I_TMorTE == 0) 
    TV = ZBesTab(M,N);
elseif (I_TMorTE == 1) 
    TV = ZBesPTab(M,N);
end
rho = rho*TV(N);
rv = besselj(M,rho);
normfac = max(abs(rv))+1e-2;
rv = rv/normfac;
for jmov = 1:21
    Z = cos(M*theta - (jmov-1)*0.1*pi)'*rv;
    surf(X,Y,Z)
    view(2)
    shading interp
    axis([-1 1 -1 1 -1 1 -1 1]), axis square, axis off
    cb = colorbar;
    set(cb,'FontName','Arial','FontSize',12,'YTick',[-1 0 1])
    if (I_TMorTE == 0 & M >= 0)... 
            titstr = ['TM^+' int2str(abs(M)) int2str(N)...
            ' {\itE}_{\itz}'];
    elseif (I_TMorTE == 0 & M < 0)... 
            titstr = ['TM^-' int2str(abs(M)) int2str(N)...
            ' {\itE}_{\itz}'];
    elseif (I_TMorTE == 1 & M >= 0)...
            titstr = ['TE^+' int2str(abs(M)) int2str(N)...
            ' {\itE}_{\itz}'];
    elseif (I_TMorTE == 1 & M < 0)...
            titstr = ['TE^-' int2str(abs(M)) int2str(N)...
            ' {\itE}_{\itz}'];
    end
    title(titstr,'FontName','Arial','FontSize',16)
    figure(gcf)
    F(jmov) = getframe;
end
movie(F,5)