! Maximilian Fernaldy
! C2TB1702

program ex1_1
    integer :: number = 0
    real, parameter :: pi = 3.1415927e0
    real :: a
    real :: b
    real :: x
    real :: y
    real :: nu
    real :: r

    number = number + 1
    x = 2e0
    y = sqrt(x**2 + x + 1e0)
    print *, "y = "
    print *, y
    print *

    number = number + 1
    x = 45e0 * pi / 180e0
    ! Fortran trigonometric functions take radians for their parameters, need to convert first
    y = 1.5418e0/(2e0 * sin(x))
    print *, "y = "
    print *, y
    print *

    number = number + 1
    x = 5e0
    y = (9.8e0 * x**2)/2e0
    print *, "y = "
    print *, y
    print *

    number = number + 1
    a = 100e0
    b = 10e0
    y = 10 * log10(a/b)
    print *, "y = "
    print *, y
    print *

    number = number + 1
    a = 5e0
    b = 2.5e0
    y = 5e0 * (a + b)**2
    print *, "y = "
    print *, y
    print *

    number = number + 1
    r = 0.05e0
    nu = (4e0/3e0) * pi * r**3
    print *, "nu = "
    print *, nu

end program
