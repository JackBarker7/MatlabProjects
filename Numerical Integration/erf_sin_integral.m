function [y] = erf_sin_integral(x)
%erf_sin_intergal Returns the integrand of the function as defined in
%exercise 2
	y = exp(-(x.^2)) .* (sin(100*pi*x)).^2;
end