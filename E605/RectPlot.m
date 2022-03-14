% RectPlot
%
% This routine plots TM and TE modes in a rectangular waveguide.
% Written for ENEE 605 by C. R. Menyuk, October 12, 2009.

AR = 2; %aspect ratio
I_TMorTE = 1;  %equals 0 for TM modes; equals 1 for TE modes
M = 1;  N = 0; %mode numbers

close all

x = 0:0.01:1.0;
y = 0:0.01:1.0;
if (I_TMorTE == 0) z=0.99*sin(M*pi*x)'*sin(N*pi*y);
elseif (I_TMorTE == 1) z=0.99*cos(M*pi*x)'*cos(N*pi*y);
end
for jmov = 1:21
    zv = z*cos((jmov-1)*0.1*pi);
    surf(x,y,zv')
    view(2)
    shading interp
    set(gca,'PlotBoxAspectRatio',[AR 1 1],...
            'ZLim',[-1 1],'CLim',[-1 1],...
            'XTick', [0 1],'XTickLabel',[0 AR],...
            'YTick', [0 1],'YTickLabel',[0 1],...
            'FontName','Arial','FontSize',12)
    xlabel('\itx','FontName','Arial','FontSize',16)
    ylabel('\ity','Rotation',0.0,'FontName','Arial','FontSize',16)
    cb = colorbar;
    set(cb,'FontName','Arial','FontSize',12,'YTick',[-1 0 1])
    if (I_TMorTE == 0) titstr = ['TM'...
            int2str(M) int2str(N) ' {\itE}_{\itz}'];
    elseif (I_TMorTE == 1) titstr = ['TE'...
            int2str(M) int2str(N) ' {\itH}_{\itz}'];
    end
    title(titstr,'FontName','Arial','FontSize',16)
    figure(gcf)
    F(jmov) = getframe;
end
movie(F,5)