program accuracy
    implicit none

    integer :: i
    real :: a, b

    print *, 'a=0.02e0'
    a=0.02e0
    print *, a
    print "(f15.10)", a ! Format specifier: show 15 digits of the number, 10 of
    ! which are to the right of the decimal point
    print * 

    print *, 'a=1.02e0'
    a=1.02e0
    print *, a
    print "(f15.10)", a
    print *

    print *, 'a=10.02e0'
    a=10.02e0
    print *, a
    print "(f15.10)", a
    print *

    print *, 'a=100.02e0'
    a=100.02e0
    print *, a
    print "(f15.10)", a
    print *
    
    print *, 'a=100.02e0'
    a=100.02e0
    print *, a
    print "(f15.10)", a
    print *

    print *, 'a=1000.02e0'
    a=1000.02e0
    print *, a
    print "(f15.10)", a
    print *

    print *, 'Add 0.01 times 10000'
    b=0e0
    do i=1, 10000
        ! Kind of like a for loop
        b=b+0.01e0
    end do
    print *, b
    print "(f15.10)", b

    stop
end program
