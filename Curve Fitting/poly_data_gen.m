function [data] = poly_data_gen(n, coeffs, e)
%takes a number of x points(n), polynomial coefficients (coeffs), 
%and rms value (e), and returns a matrix of data
%points fitted along the inputted curve, with some random error added

	%the function generates n x values in the interval [-5,5]
	%errors are created using a gaussian distribution mean 0, variance 1


	xvals = linspace(-5,5,n).'; %generates n x values in interval [-5,5]
	
	yi_vals = zeros(n,1); %empty array to fill with y values
	%use coefficients and x values to generate y values 
	for i = 1:length(coeffs)
		yi_vals = yi_vals+coeffs(i).*xvals.^(i-1);
	end



	errs = randn(n,1); %generate error values

	data = xvals; %save x values in first column of return matrix
	data(:, 2) = yi_vals + e.*errs; %generate y values with errors and save in second column of return matrix
	


end