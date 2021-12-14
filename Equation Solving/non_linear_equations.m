format longG %show roots to greater degree of precision

bisection_root = bisection(@f, 0, 5, 1e-9)

newton_root = newtonR(@f, @fprime, 3, 1e-9)

matlab_root = fzero(@f, 3)