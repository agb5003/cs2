! Exercise 2-2: Volume of sphere (Triple integration method)
! Maximilian Fernaldy
! C2TB1702

program ex2_2
    implicit none

    real, parameter :: R = 5
    real, parameter :: PI = 3.141593
    real :: theoreticalVolume = (4./3.) * PI * R*R*R ! Theoretical value is pi*5^2 = 78.54
    real, parameter :: allowableError = 0.001 ! 0.1% (Reduced for reasonable execution time)

    integer :: N
    integer, parameter :: Nmax = 100000
    integer, parameter :: dN = 100

    double precision :: dr
    double precision :: dtheta
    double precision :: dphi
    double precision :: sin_phi
    double precision :: currentRadius
    double precision :: volume
    double precision :: error

    integer :: i ! Counter for integration
    integer :: j ! Counter for integration
    integer :: k ! Counter for integration

    integer :: p ! Counter for precision increase

    ! Consider a sphere of radius R. A small volume has width dr along the r axis,
    ! length r*dtheta along the theta axis and length sin(phi)*dphi along the phi axis.
    ! Consequently its volume is r^2 * sin(phi) * dr * dtheta * dphi.
    do p = 1, Nmax
        N = p * dN
        dr = R / N
        dtheta = 2*PI / N
        dphi = PI / N
        
        volume = 0
        ! Integration along phi
        do i = 1, N
            sin_phi = sin(dphi * i)
            ! Integration along r
            do j = 1, N
                currentRadius = dr*j
                ! Integration along theta
                do k = 1, N
                    volume = volume + currentRadius*currentRadius * sin_phi * dtheta * dr * dphi
                enddo
            enddo
        enddo
        ! Integration is done in this order because sin(phi) is the most computationally
        ! expensive operation in the integrand. The variable r = dr*i is a simple
        ! multiplication, while sin(phi) is a trigonometric function, which is probably
        ! implemented using series expansions, requiring multiple arithmetic operations.
        ! By placing the calculation for sin(phi) at the topmost level of the integral,
        ! The computer running the program will only need to run it once for every value
        ! of phi (N times) instead of N*N times when placed in the second level or N*N*N
        ! in the third level.

        error = abs((volume - theoreticalVolume) / theoreticalVolume)

        ! Exit loop when error is sufficiently low
        if (error <= allowableError) then
            print *, "# of infinitesimals used = ", N
            print *, "Volume of sphere = ", volume, "Theoretical value = ", theoreticalVolume, "Error = ", error
            exit
        endif
    enddo

    ! Print error message if Nmax was exceeded
    if (N > Nmax) then
        print *, "N exceeded Nmax before an allowable error was reached."
        print *, "# of infinitesimals used = ", N
        print *, "Volume of sphere = ", volume, "Theoretical value = ", theoreticalVolume, "Error = ", error
    endif

    stop
end program

