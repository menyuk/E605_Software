% EYcontour
%
% This routine plots E_y on the y=b surface in a 
% rectangular waveguide with M=1 and N=1.  
% Written for ENEE 605 by  C. R. Menyuk, 
% November 2, 2009 for PS 2, no. 3.

AR = 2; %aspect ratio = number of wavelengths kept
AR = fix(AR);  %AR must be an integer >=1
if (AR < 1), AR = 1; end
clear xtv xtl
for mv = 0:AR
    xtv(mv+1) = mv/AR;
    xtl(mv+1) = mv;
end

close all

x = 0:0.01:1.0;
z = 0:0.01:1.0;
for jmov = 1:21
    zv = 0.99*cos((jmov-1)*0.1*pi-2*AR*pi*z)'*sin(pi*x);
    surf(z,x,zv')
    view(2)
    shading interp
    set(gca,'PlotBoxAspectRatio',[AR 1 1],...
            'ZLim',[-1 1],'CLim',[-1 1],...
            'XTick', xtv,'XTickLabel',xtl,...
            'YTick', [0 1],'YTickLabel',[0 1],...
            'FontName','Arial','FontSize',12)
    xlabel('{\itz}/{\it\lambda}','FontName','Arial','FontSize',16)
    ylabel('{\itx}/{\ita}','FontName','Arial','FontSize',16)
    cb = colorbar;
    set(cb,'FontName','Arial','FontSize',12,'YTick',[-1 0 1])
    title('{\itE}_{\ity} (TM_{11} or TE_{11})',...
        'FontName','Arial','FontSize',16)
            %set(gcf,'Position',[1 31 1440 796])
            %this command, when not commented out, sets the movie 
            %to full size on my computer
    figure(gcf)
    F(jmov) = getframe;
end
movie(F,5)