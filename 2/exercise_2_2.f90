! Exercise 2-2: Volume of sphere (Single integration method from theoretical surface area formula)
! Maximilian Fernaldy
! C2TB1702

program ex2_2
    implicit none

    real, parameter :: R = 5
    real, parameter :: PI = 3.141593
    real, parameter :: theoreticalVolume = (4./3.) * PI * R*R*R ! Theoretical value is (4/3) * pi * 5^3 = 523.6
    real, parameter :: allowableError = 0.0001 ! 0.01%

    integer :: N
    integer, parameter :: Nmax = 100000
    integer, parameter :: dN = 100

    real :: dr
    real :: surfaceArea
    real :: volume
    real :: error

    integer :: i ! Counter for integration

    integer :: p ! Counter for precision increase

    do p = 1, Nmax
        N = p * dN
        dr = R / N
        
        volume = 0
        do i = 1, N
            ! Calculate surface area of thin shell at radius dr*i
            surfaceArea = 4 * PI * (dr*i)*(dr*i)
            volume = volume + surfaceArea * dr
            !                 ^^^^^^^^^^^   ^^
            !          shell surface area   shell width
        enddo

        error = abs((volume - theoreticalVolume) / theoreticalVolume)

        ! Exit loop when error is sufficiently low
        if (error <= allowableError) then
            print *, "# of thin shells used = ", N
            print *, "Volume of sphere = ", volume, "Theoretical value = ", theoreticalVolume, "Error = ", error
            exit
        endif
    enddo

    ! Print error message if Nmax was exceeded
    if (N > Nmax) then
        print *, "N exceeded Nmax before an allowable error was reached."
        print *, "# of thin shells used = ", N
        print *, "Volume of sphere = ", volume, "Theoretical value = ", theoreticalVolume, "Error = ", error
    endif

    stop
end program

