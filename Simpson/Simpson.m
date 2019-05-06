function [I] = Simpson(x,y)
%Created By Trevor Long
%Last Modified 4/15/2019
%------------------------------------------------------------------------
%[I] = Simpson(x,y)
%Function uses Simpsons 1/3 rule to evaluate the integral of tabular data
%of the vector function values 'y' with respect to 'x'
%------------------------------------------------------------------------
%Inputs:
%x: Spacing of data in x
%y: Function values at corresponding x
%Outputs:
%I: The calculated integral value
%------------------------------------------------------------------------

%Check number of inputs
if nargin ~= 2
    error('Incorrect number of inputs (must be 2)');
end

if length(x) == length(y) %Check that x and y are same length
    xl1 = x(1); %The first value of x
    xl2 = x(length(x)); %The last value of x
    xcheck = linspace(xl1,xl2,length(x)); %Creates vector with equal spacing between the endpoints of x
    sumv = zeros(1); %Creates vector to sum integral values
    if xcheck == x %Check that x is equally spaced using xcheck
        if mod(length(x),2) == 0 %0 is even
            disp('The trapazoidal rule was used to calculate the last interval');
            h = (x(3)-x(1))/2;
            for c = 1:2:(length(x)-4) %Sets c equal to the beginging point for every iter of 1/3 rule
                sumv(c,1) = (h/3)*(y(c)+4*y(c+1)+y(c+2)); %Calculates value of integral and puts in vector
            end
            %Trapazoid rule for last segment
            a = length(y)-1;
            b = length(y);
            trapend = (b-a)*(y(b)+y(a))/2;
            I = trapend+sum(sumv);
        else %if the length is odd
            h = (x(3)-x(1))/2;
            for c = 1:2:(length(x)-3)
                sumv(c,1) = (h/3)*(y(c)+4*(y(c+1))+y(c+2));
            end
            I = sum(sumv);
        end
    else
        error('The values of x are not equally spaced');
    end
else
    error('The length of x and y are not equal');
end
end

