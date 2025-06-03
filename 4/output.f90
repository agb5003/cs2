program output
    real x, y
    integer n
    open(12, file="output.txt", status="replace", position="rewind")
    x=1.5; y=0.03; n=100
    write(12, 600) x, y, n
    600 format(" x = ", f10.5, " y = ", es12.5, " n = ", i10)
    close(12)
    stop
end program output
