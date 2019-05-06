# falsePosition.m
This MatLab R2018b program estimates roots using false position bracketing 
numerical method

# I/O:
1. Inputs
..*func - the function being evaluated
..*xl - the lower bound
..*xu - the upper bound
2. Optional Inputs
..*es - the desired relative error
..*maxiter - maximum number of interations
3. Outputs
..*root - estimated root location
..*fx - the function evaluated at the root
..*ea - percent relative error
..*iter - how many interations were performed
4. Help
..*Use a function with handle for func
..*Ex: @(x)x^2+x

