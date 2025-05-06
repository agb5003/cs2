program implicit_conversion
    implicit none
    double precision :: a = 9.8d0 ! Correct way
    double precision :: b = 9.8 ! Incorrect way
    print *, a
    print *, b
end program
