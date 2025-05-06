! Exercise 2-1: Area of circle (Single integration method from theoretical circumference formula)
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

    real :: dr
    real :: area
    real :: error

    integer :: i ! Counter for integration

    integer :: p ! Counter for precision increase

    do p = 1, Nmax
        N = p * dN
        dr = R / N
        
        area = 0
        do i = 1, N
            area = area + PI * 2 * (dr*i) * dr
            !                      ^^^^^^   ^^
            !         strip circumference   strip width
        enddo

        error = abs((area - theoreticalArea) / theoreticalArea)

        ! Exit loop when error is sufficiently low
        if (error <= allowableError) then
            print *, "# of thin strips used = ", N
            print *, "Area of circle = ", area, "Theoretical value = ", theoreticalArea, "Error = ", error
            exit
        endif
    enddo

    ! Print error message if Nmax was exceeded
    if (N > Nmax) then
        print *, "N exceeded Nmax before an allowable error was reached."
        print *, "# of thin strips used = ", N
        print *, "Area of circle = ", area, "Theoretical value = ", theoreticalArea, "Error = ", error
    endif

    stop
end program
