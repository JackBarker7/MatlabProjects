function [a,b, rms] = least_squares(xarr,yarr)
%least_squares Returns coefficients after performing least squares
%regression on the input arrays
%   xarr and yarr should be input arrays of data
%	returns coefficients a and b for the fit line y=a+bx, as well as the
%	rms value for the data set
	
	%we first need to find the matrices Xmat and Ymat in the equation 
	%Xmat*amat = Ymat, where the matrix amat contains the desired
	%coefficients
	Xmat = [length(xarr), sum(xarr); sum(xarr), sum(xarr.^2)];
	Ymat = [sum(yarr); sum(yarr.*xarr)];

	amat = Xmat\Ymat;

	%amat contains [a,b], so we can extract these:
	a = amat(1);
	b = amat(2);

	%and finally, calculate the rms value of the data

	%to get the fitted y values, we use the values of a and b found earlier
	yfit = a+b*xarr;

	%We can then use the equation for the rms value to calculate it:
	rms = sqrt(1/(length(xarr)) * sum((yarr-yfit).^2));



end