function [root] = newtonR(f,fprime, x1, tol)
%newtonR Returns root of f using Newton-Raphson method
%   f is the function in question, fprime is its derivative
%   x1 is an x value near the root
%   tol is the required tolerance

    
    %set maximum number of iterations before function throws an error to
    %prevent an infinite loop
    max_iter = 500;

    for i = 1:max_iter
        if abs(f(x1))<=tol
            %check if we have reached desired accuracy. If we have, return
            %x1 as the root
            root=x1;

            %break to prevent unnecessary iteration
            break
        else
            %calculate a new value of x1
            x1 = x1-f(x1)/fprime(x1);
        end
    end
    
    if abs(f(x1)) > tol
        %if no root was found, raise an error
        error("root not found")
    else
        %we may have found the root on the final iteration
        root=x1;
        


end