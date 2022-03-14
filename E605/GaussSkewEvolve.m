% GaussSkewEvolve
%
% This routine plots skew diagrams for phi-prime versus
% tau for Gaussian pulses that evolve due to dispersion.
%

close all
zeta = 5.0                 %Distance evolution parameter
Tmax = 40.0                %Bit half-duration parameter
Tsep = 5.0                 %Bet separation

TC = -Tmax:0.01:Tmax;      %Range of time values

%Calculate the basic skew plot
%
tau_max = sqrt(log(100)*(1+zeta^2));   %maximum skew plotting time
N_max = ceil(tau_max/0.01);
tau =0.01*(-N_max:N_max);
phi_prime = zeta*tau/(1+zeta.^2);

%Plot the skew data
%
hold on
axis([-Tmax Tmax -2.0 2.0])
plot(tau-9.5*Tsep,phi_prime,'Linewidth',2)
plot(tau-7.5*Tsep,phi_prime,'Linewidth',2)
plot(tau-6.5*Tsep,phi_prime,'Linewidth',2)
plot(tau-5.5*Tsep,phi_prime,'Linewidth',2)
plot(tau-1.5*Tsep,phi_prime,'Linewidth',2)
plot(tau+0.5*Tsep,phi_prime,'Linewidth',2)
plot(tau+1.5*Tsep,phi_prime,'Linewidth',2)
plot(tau+2.5*Tsep,phi_prime,'Linewidth',2)
plot(tau+6.5*Tsep,phi_prime,'Linewidth',2)
plot(tau+8.5*Tsep,phi_prime,'Linewidth',2)
set(gcf,'Position',[420 528 560 105])
set(gca,'Linewidth',2)
hold off
