function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%Created by Trevor Long
%3/4/2019
%-------------------------------------------------------------------------
%falsePosition - Finds an approximent root using false position bracketing
%function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%-------------------------------------------------------------------------
%Input: 
%func - the fuction being evaluated
%xl - the lower bound
%xu - the upper bound
%Optional inputs:
%es - the desired relative error
%maxiter - maximum number of interations
%--------------------------------------------------------------------------
%Outputs:
%root - estimated root location
%fx - the function evaluated at the root
%ea - percent relative error
%iter - how many iterations were performed
%--------------------------------------------------------------------------
%Hint:
%Use @(x)x^2+x to set the function x^2+x as the function
%--------------------------------------------------------------------------

xrold = xl+10; %Sets previous approx to zero to something where first error will be large

if nargin < 3 %Error message if there are not enough variables inputted
    error('Not enough input arguments');
else
    if nargin < 4 %Sets variables if only the 3 are specified
        maxiter = 200;
        es = .0001;
    end
    if nargin < 5 %Sets variable if 4 are specified
        maxiter = 200;
    end
end
es = es/100; %takes es out of percent form
errorabs = 1000; %Sets error to something large so first iteration runs
c = 0; %Sets counter to zero

while errorabs > es && c < maxiter %While error is greater then spedified or iterations are less then spedified
    
    signtest = [func(xl),func(xu)]; %Puts function values at xl and xu into a matrix
    if c == 0 %Prevents this code from running unnecessarily to save time
        signtest2 = signtest < 0; %Creates matrix testing whether the values in previous are negative
        signtest3 = xor(signtest2(1),signtest2(2)); %Tests to make sure the two values are different
    end
    c = c + 1; %Increases counter by 1
    
    if signtest3 == 1 %Runs if sign test is good
        xr = xu-(signtest(2)*(xl-xu))/(signtest(1)-signtest(2)); %Finds value of xr
        fxr = func(xr); %Finds value of function at xr
        
        if fxr > 0 %Tree for setting values properly
            if signtest(2) < 0
                xl = xr;
            else
                xu = xr;
            end
        else
            if signtest(2) < 0
                xu = xr;
            else
                xl = xr;
            end
            
        end
        errorabs = abs((xr-xrold)/xr); %Calculates error based on xr and the previous xr
        xrold = xr; %Sets current xr to previous xr
    else
        error('Does not bracket root'); %Error if there is no root
    end
    
    
   
end

root = xr; %Sets variables to the output variables
fx = fxr;
ea = errorabs*100;
iter = c;