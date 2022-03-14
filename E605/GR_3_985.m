% GR_3_985
%
% This routine determines integral 3.985 from Gradshteyn and
% Rhyzik int 0^infty (sech^nu(x) * cos(Ax))dx
%
clear all
A=[0:1];
nu=2;
N=250
for j=1:4
    y=[1:N]';
    r1=1+nu./y;
    v1=r1*ones(size(A));
    v2=v1+0.25.*(ones(size(y))./y.^2)*(nu^2+A.^2);
    vect=(v1./v2);
    factor=(2.0^nu)*(nu*ones(size(A))./(nu^2+A.^2));
    correct=exp((-0.25/nu)*(nu.^2+A.^2)*log((N+1.5+nu)/(N+1.5)));
    vunc(j,:)=factor.*prod(vect);
    vcalc1(j,:)=factor.*correct.*prod(vect);
    N=2*N;
end
for j=2:4
    vcalc2(j,:)=(1/3)*(4*vcalc1(j,:)-vcalc1(j-1,:));
end
for j=3:4
    vcalc3(j,:)=(1/7)*(8*vcalc2(j,:)-vcalc2(j-1,:));
end
vfinal=(1/15)*(16*vcalc3(4,:)-vcalc3(3,:));
format long
vunc, vcalc1, vcalc2, vcalc3, vfinal
format short
