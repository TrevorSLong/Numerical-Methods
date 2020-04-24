function [xr,yr,a0,a1] = removeOutliars(xr,yr,n,a0,a1)
%Created by Trevor Long
%3/4/2019
%--------------------------------------------------------------------------
%Inputs:
%Required:---
%xr - x data
%yr - y data
%Optional:---
%n - degree of regression (1 if not specified)
%OR: (Use ~ for n, n will not be used if these are entered)
%a0 - Linear y intercept 
%a1 - Linear slope
%If unspecified linear regression slope is calculated automatically
%--------------------------------------------------------------------------
%Outputs
%xr - x data
%yr - y data
%a0 - Linear y intercept 
%a1 - Linear slope
%Graph of all points and regression without outliars
%Graph of deviation from non-outliar data to regression line
%--------------------------------------------------------------------------
%Other notes
%-95% Confidence is used to eliminate outliars
%-May not work well with non-linear data

xrn = xr; %Saves original xr data for end
yrn = yr; %Saves original yr data for end
if nargin < 2 %Error message if there are not enough variables inputted
    error('Not enough input arguments');
else
    if nargin < 3 %Sets variables if only the 2 are specified
        n=1;
        l = polyfit(xr,yr,n);
        yn = polyval(l,xr);
    end
    if nargin == 3 %Sets variable if 3 are specified
        l = polyfit(xr,yr,n);
        yn = polyval(l,xr);
    end
    if nargin == 4 %Sets variable if 4 are specified
        error('Need to input a0 and a1');
    end
    if nargin == 5 %Sets variable if 5 are specified
        C = numel(xr);
        y = ones(1,C);
        yn = y*a1+a0;
    end
end

S = std(yr); %Finds standard deviation of original data
M = mean(yr); %Finds mean of original data
N = numel(yr); %Finds length of original vector
Z = 1.96; %Confidence level 95%
Delta = Z*(S/sqrt(N)); %Finds the maximum deviation to not be an outliar

B = abs(yn-yr)< Delta; %T/F matrix if values fall within Delta

yf = yr(B~=0); %Removes outliars from yr
xf = xr(B~=0); %Removes outliars from xr
%Creates regression vector
r2 = polyfit(xf,yf,n);
r = polyval(r2,xf);

%Sets outputs
xr = xf;
yr = yf;

residuals = yf-r;

%Plots data
figure
plot(xrn,yrn,'o')
hold on
plot(xf,r)
hold off

C2 = numel(xf);
C3 = xf(C2);
z = zeros(1,C3);

figure
plot(xf,residuals,'o')
hold on
plot(z);
hold off
