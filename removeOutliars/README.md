# removeOutliars

##Inputs:

###Required:---
   * xr - x data
   * yr - y data
###Optional:---
   * n - degree of regression (1 if not specified)
####OR: (Use ~ for n, n will not be used if these are entered)
   * a0 - Linear y intercept 
   * a1 - Linear slope
   * If unspecified linear regression slope is calculated automatically

##Outputs
   * xr - x data
   * yr - y data
   * a0 - Linear y intercept 
   * a1 - Linear slope
   * Graph of all points and regression without outliars
   * Graph of deviation from non-outliar data to regression line

##Other notes
   * 95% Confidence is used to eliminate outliars
   * May not work well with non-linear data
