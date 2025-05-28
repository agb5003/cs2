! Computer Seminar II
! Class 4 Exercise 7-1
! C2TB1702
! Maximilian Fernaldy

program triangle
    double precision :: tri(3)
    double precision :: p
    double precision :: area
    
    open(20, file="in1.dat", status="old")
    read(20, *)(tri(i), i=1,3)
    close(20)

    p = sum(tri)/2
    area = sqrt(p * (p-tri(1))*(p-tri(2))*(p-tri(3)))

    600 format("The area of the triangle is ", f10.5, " units.")
    open(21, file="out1.dat", status="replace")
    write(21, 600) area

end program