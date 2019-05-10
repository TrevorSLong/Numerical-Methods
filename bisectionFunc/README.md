# bisectionFunc.m
This MatLab R2018b program estimates the root of a function using a lower 
and upper guess using the bisection method

#Usage:
   * [root,err] = bisection(func,xi,xu,derror]
# I/O:
1. Inputs
   * func - function with handle to find root example: @(x)(x^2+2x)
   * xi - guess lower then root
   * xu - guess higher then root
2. Optional Inputs
   * derror - desired error (if blank .01 is used)
3. Outputs
   * root - estimated root location
   * err - calculated relative error
4. Help
   * Use a function with handle for func
   * Ex: @(x)x^2+x
# Notes:
   * Algorithm requires two guesses that bracket the root (xi and xu)
   * Algorithm must have all required inputs to work
