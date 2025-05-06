program specifiers
    implicit none
    real :: myReal2 = 1.02e0

    print *, myReal2
    print "(f15.10)", myReal2 ! Print 15 digits, with 10 of them behind the decimal point
    stop
end program
