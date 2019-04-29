function [L,U,P] = luFactor(A)
%Program Created By Trevor Long - Last Modified 3/29/2019
%------------------------------------------------------------------
%luFactor [L,U,P] = luFactor(A)
%   Enter a square matrix as A and the function will return L, U, P
%------------------------------------------------------------------
%Inputs
%   A - n x m square matrix to decompose
%------------------------------------------------------------------
%Outputs
%   L - lower triangular matrix
%   U - upper triangular matrix
%   P - pivot matrix


P = eye(size(A)); %Create Identity Matrix
L = zeros(size(A)); %Creates matrix of zeros
[m,n] = size(A); %Find Size
C = 2; %Counter for sub-row being worked on
C2 = 1; %Counter for row being worked on
C3 = 1; %Counter for column being worked on
while C3 <= n-1 %while the column being worked on is less then the total columns
    %Pivoting -------------------------------------------------------------
    B = abs(A); %Matrix with absolute values for determining what to pivot
    [m2,p] = max(B(C2:m,C3)); %Find position of largest value in column 1
    %Swap rows in A
    SA = A(C2,:);
    A(C2,:) = A(p+C2-1,:);
    A(p+C2-1,:) = SA;
    %Swap rows in P
    SAP = P(C2,:);
    P(C2,:) = P(p+C2-1,:);
    P(p+C2-1,:) = SAP;
    %Swap rows in L
    LAP = L(C2,:);
    L(C2,:) = L(p+C2-1,:);
    L(p+C2-1,:) = LAP;
    %----------------------------------------------------------------------
    %Eliminate columns
    while C <= m %while current row being worked on is less then total
        DA = A(C,C3)/A(C2,C3); %Divides a21/a11 ect.
        L(C,C3) = DA; %Sets value of DA in L
        DA2 = DA*(A(C3,:)); %Creates the vector used for subtracting
        DA3 = A(C,:)-DA2; %Creates the vector after elimination
        A(C,:) = DA3; %replaces row with eliminated row
        C = C+1; %Counts up for sub-row
    end
    C3 = C3+1; %Counts up for column
    C2 = C2+1; %Counts up for row
    C = C2+1; %Resets sub-row to new starting point
end

U = A; %sets A to the output variable
L = L+eye(size(A)); %Finishes creating lower triangular
end

