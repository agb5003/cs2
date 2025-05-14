program test
    implicit none
    integer :: freq(26) = 0
    character(len=1) :: char = 'a'
    character(len=5) :: string = "abcde"
    integer :: i

    print *, iachar(char)

    do i = 1, len(string)
        print *, iachar(string(i:i)) - iachar('a') + 1
    enddo


    stop
end program