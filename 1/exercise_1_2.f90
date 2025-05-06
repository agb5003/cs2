! Maximilian Fernaldy
! C2TB1702

program ex1_2
    real :: x1
    real :: x2

    ! Parameters for this exercise:
    real, parameter :: a = 2e0
    real, parameter :: b = -2e0
    real, parameter :: c = -12e0

    ! Use the formula for the roots of a quadratic equation
    x1 = (-b + sqrt(b**2 - 4*a*c))/(2*a)
    x2 = (-b - sqrt(b**2 - 4*a*c))/(2*a)

    print *, "x1 = "
    print *, x1
    print *, "x2 = "
    print *, x2
    
end program
