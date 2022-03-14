% Helmholtz
%
% The H-field along the z-axis of Helmholtz rings is plotted
% in normalized units.  The H-field is normalized to 
% I/r = (current/ring radius).  The distance along the z-axis
% is normalized to the ring radius

% Input parameters
Zmax = 5;     % the range of z-values is (-Zmax,Zmax) in
              % normalized units
ratio = [0.5 1.0 2.0]'    % the ratio of the separation to
                              % the radius in normalized units
npoints = 1001;    % the number of evaluation points

% Set up fields
   %Fix z-values and corresponding ONES array
   Delta = 2*Zmax/(npoints-1);   Z = -Zmax:Delta:Zmax;
   IZ = ones(size(Z));   
   
   %Set up a ONES array for the ratio
   IR = ones(size(ratio));
   
   %Set up the + and - Helmholtz coil distances
   Zplus = IR*Z + 0.5*ratio*IZ;    Zminus = IR*Z - 0.5*ratio*IZ;

% Calculate the H-field
H = 0.5*((1 + Zplus.^2).^(-3/2) + (1 + Zminus.^2).^(-3/2));

% Plot the H-field
hold off
plot(Z,H,'linewidth',2)
grid
xlabel('z/r');  ylabel('H/H_0');
title('Magnetic Field Along the Axis of Two Helmholtz Rings')