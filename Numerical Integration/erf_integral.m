function [y] = erf_integral(x)
%erf_intergal Returns the integrand of the erf function
	y = exp(-(x^2));
end