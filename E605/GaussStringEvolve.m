% GaussStringEvolve
%
% This routine plots IQ diagrams for strings of initially
% Gaussian pulses that evolve due to dispersion.
%

close all
zeta = 5.0                 %Distance evolution parameter
Tmax = 40.0                %Bit half-duration parameter
Tsep = 5.0                 %Bet separation

TC = -Tmax:0.01:Tmax;        %Range of time values
F = (1+j*zeta).^(-1/2);      %Gaussian shape factor

CU =  exp(-0.5*F.^2*(TC-5.5*Tsep).^2)...
    + exp(-0.5*F.^2*(TC-3.5*Tsep).^2) + exp(-0.5*F.^2*(TC-2.5*Tsep).^2)...
    + exp(-0.5*F.^2*(TC-1.5*Tsep).^2) + exp(-0.5*F.^2*(TC+2.5*Tsep).^2)...
    + exp(-0.5*F.^2*(TC+4.5*Tsep).^2) + exp(-0.5*F.^2*(TC+5.5*Tsep).^2);
RU = real(CU);
IU = imag(CU);
MU = RU.^2 + IU.^2;
plot(TC,[RU;IU]','Linewidth',2)
set(gca,'Linewidth',2)
figure
plot(RU,IU,'Linewidth',2)
axis([-1 1 -1 1])
axis square
set(gca,'Linewidth',2)