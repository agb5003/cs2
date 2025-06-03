program ex5
    real x, y, m, r
    integer n
    open(20, file="in.dat")
    read(20, *) x, y, n
    ! read(20, *) r
    close(20)
    write(*, *) x, y, n
end program
