% Graphical representation of sparse matrices, based on the MATLAB
% documentation for the airfoil data.

clear all
close all

load airfoil

% Scaling x and y
x = pow2(x,-32); 
y = pow2(y,-32);

% Forming the sparse adjacency matrix and making it positive definite
n = max(max(i),max(j));
A = sparse(i,j,-1,n,n);
A = A + A';
d = abs(sum(A)) + 1;
A = A + diag(sparse(d));
% Plotting the finite element mesh
gplot(A,[x y])

figure
spy(A)
title('The adjacency matrix')

figure
r = symrcm(A);
spy(A(r,r))
title('Reverse Cuthill-McKee')

figure
j = colperm(A);
spy(A(j,j))
title('Column count reordering')

figure
m = symamd(A);
spy(A(m,m))
title('Appropriate minimum degree')


