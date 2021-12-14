function [coeffs] = poly_least_squares(m,data)
%fits an m degree polynomial curve through points in data using least
%squares regression. Returns a list of coefficients, coeffs

	%first step is to generate the (m+1)x1 matrix Y_mat

	Y_mat = zeros(m+1, 1); %create a Y matrix full of zeroes to be filled in for loop

	for k = 1:m+1
		%use equation Y_k = sum(x_i^(k-1) * y_i) to generate Y matrix values
		Y_mat(k,1) = sum(data(:, 1).^(k-1).*data(:, 2));
	end

	X_mat = zeros(m+1, m+1); %create X matrix full of zeros to be filled

	for k=1:m+1
		for j=1:m+1
			%use equation X_kj = sum(x_i^(j+k-2)) to get X matrix values
			X_mat(k,j) = sum(data(:, 1).^(j+k-2));
		end
	end

	%finally, generate and return coefficient values
	coeffs = X_mat\Y_mat;


end