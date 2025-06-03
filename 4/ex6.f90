program ex6
    real :: x1, y1, x2, y2
    real :: distance

    open(20, file="ex6_input.txt", status="old")
    read(20, *) x1, y1, x2, y2
    close(20)
    
    open(21, file="ex6_output.txt", status="replace")
    500 format("The distance between the two points is ", f10.5, " units.")

    distance = sqrt((x2-x1)**2 + (y2-y1)**2)

    write(21, 500) distance

    close(21)
end program
