function [root] = bisection(f,x1, x2, tol)
%bisection Returns the root of f using the bisection method. 
%   x1 and x2 should be points near the root such that 
%   f(x1) and f(x2) have opposite signs
%   tol is the desired accuracy

    %set maximum number of iterations before function throws an error to
    %prevent an infinite loop
    max_iter = 500;

    if f(sign(x1)) == f(sign(x2))
        %Make sure f(x1) and f(x2) have opposite signs
        error("f(x1) and f(x2) must have opposite signs")
    elseif x1 == x2
        %Make sure x1 and x2 are different
        error("x1 and x2 cannot be the same")
    end

    if x1 > x2
        %x1 should be less than x2. Swap them if this is not the case
        temp=x2;
        x2 = x1;
        x1 = temp;
    end
    
    x3 = (x1+x2)./2;

    for i = 1:max_iter
        if abs(f(x3)) <= tol
            %if we have reached desired accuracy, break out of the for loop
            %it is important to use abs as otherwise if f(x3) is negative,
            %the program will return this x3 as a root
            root=x3;

            %break the for loop to prevent unnecessary iteration
            break
        else
            %check the sign of f(x3). Replace whichever of x1 and x2 has
            %the same sign as x3
            if sign(f(x3)) == sign(f(x1))
                x1=x3;
            else
                x2=x3;
            end
            %calculate new value of x3
            x3 = (x1+x2)./2;
        end
    end
    %if we reach the end of the for loop and no root was found,
    %raise an error
    if abs(f(x3))>tol
        error("root not found")
    else
        %this line is necessary as the very last iteration may take us
        %within the tolerance
        root=x3;
    end
end