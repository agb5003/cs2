! Exercise 2-1: Area of circle (Double integration method)
! Maximilian Fernaldy
! C2TB1702

program ex2_1
    implicit none

    real, parameter :: R = 5
    real, parameter :: PI = 3.141593
    real :: theoreticalArea = PI * R*R ! Theoretical value is pi*5^2 = 78.54
    real, parameter :: allowableError = 0.0001 ! 0.01%

    integer :: N
    integer, parameter :: Nmax = 100000
    integer, parameter :: dN = 100

    double precision :: dr
    double precision :: dtheta
    double precision :: currentRadius
    double precision :: area
    double precision :: error

    integer :: i ! Counter for integration
    integer :: j ! Counter for integration

    integer :: p ! Counter for precision increase

    ! Consider a circle of radius R. A small strip of area has width dr along the r axis
    ! and length r*dtheta along the theta axis.
    do p = 1, Nmax
        N = p * dN
        dr = R / N
        dtheta = 2*PI / N
        
        area = 0
        ! Integration along r
        do i = 1, N
            currentRadius = dr*i
            ! Integration along theta
            do j = 1, N
                area = area + currentRadius*dtheta * dr
                !             ^^^^^^^^^^^^^^^^^^^^   ^^
                !             length along theta     width along r
            enddo
        enddo

        error = abs((area - theoreticalArea) / theoreticalArea)

        ! Exit loop when error is sufficiently low
        if (error <= allowableError) then
            print *, "# of infinitesimals used = ", N
            print *, "Area of circle = ", area, "Theoretical value = ", theoreticalArea, "Error = ", error
            exit
        endif
    enddo

    ! Print error message if Nmax was exceeded
    if (N > Nmax) then
        print *, "N exceeded Nmax before an allowable error was reached."
        print *, "# of infinitesimals used = ", N
        print *, "Area of circle = ", area, "Theoretical value = ", theoreticalArea, "Error = ", error
    endif

    stop
end program

