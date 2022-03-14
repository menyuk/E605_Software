% QR_example
% This script runs the QR example in ENEE605 LS7

close all
for nf=1:4
y=0:.1:10;
v = 1 + 0.1*y;
delta = randn(size(v));
vr = v + 0.05*delta;  b = vr';
figure
plot(y,v,y,vr,'.')
A = ones(101,2);
A(1:101,1) = 1;
A(1:101,2) = y';
x = A\b
end