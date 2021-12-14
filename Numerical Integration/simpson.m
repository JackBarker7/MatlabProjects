function [integral] = simpson(f, a, h)
%simpson Returns an approximation of the integral of f from 0 to a using
%Simpson's rule
%   a is the upper limit of the integral
%   h is the step width to use

	%number of steps = n
	n = a/h;

	if a == 0
		%if a=0, we know that the integral will be 0
		integral = 0;

	else
		%the approximation can be split up into 4 parts:
		% 1) the f(0) part. This will be the variable y0
		% 2) the f(nh). This is ynh
		% 3) the sum over i of f(ih). This is sum_yih
		% 4) the sum over i of f(h(i-1/2)). This is sum_yih_half

		y0 = f(0);
		ynh = f(n*h);
		
		%sum_fih:
		sum_yih = 0;
		for i = 1:n-1
			sum_yih = sum_yih + f(i*h);
		end
		
		%sum_fih_half
		sum_yih_half = 0;
		for i = 1:n
			sum_yih_half = sum_yih_half + f((i-1/2)*h);
		end

		%finally, we calculate the integral
		integral = (h/6) * (y0 + ynh + 2*sum_yih + 4*sum_yih_half);
	end
end