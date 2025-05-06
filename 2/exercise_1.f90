! Exercise 1: Integral of a^2 - x^2
! Maximilian Fernaldy
! C2TB1702

program ex1
    implicit none
    real :: a ! Upper limit of integration
    integer :: N ! Number of rectangular areas
    integer, parameter :: Nmax = 100000 ! Maximum number of rectangular areas
    integer, parameter :: dN = 50 ! Number of rectangles to increase by after each attempt
    real :: dx ! Small width of rectangular area
    integer :: i ! Counter for integration
    integer :: j ! Counter for precision
    real :: area ! Total area
    real, parameter :: theoreticalVal = 2./3. ! Theoretical value of integration
    real :: error
    real, parameter :: allowableError = 0.0001 ! 0.01%

    ! Set a
    a = 1.0

    do j = 1, Nmax/dN
        ! Set N
        N = dN * j

        ! Obtain width dx
        dx = a / N
        
        ! Integrate
        area = 0
        do i = 1, N
            area = area + (a*a - (i*dx)*(i*dx)) * dx
            !             ^^^^^^^^^^^^^^^^^^^^^   ^^
            !                integrand            width of rectangular area
        enddo

        ! If precision is not enough, increase N and try again
        error = abs((area - theoreticalVal) / theoreticalVal)
        if (error <= allowableError) exit

    enddo

    if (N > Nmax) then
        print *, "Exceeded maximum allowed number of rectangles. Result may not be within desired error margins."
    endif

    print *, "# of rectangles used = ", N
    print *, "Result = ", area, "Theoretical value = ", theoreticalVal, "Error = ", error

    stop
end program
