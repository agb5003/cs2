! Computer Seminar II
! Maximilian Fernaldy
! C2TB1702

program height
    use arithmetics
    implicit none

    real :: maleHeight(4) = [178.7, 165.6, 182.6, 169.3]
    real :: femaleHeight(3) = [162.5, 168.3, 158.6]
    real :: average
    real :: maxVal
    real :: minVal

    print *, "Male average height:"
    call avg(maleHeight, size(maleHeight), average)
    print *, average

    print *, "Male maximum height:"
    call max(maleHeight, size(maleHeight), maxVal)
    print *, maxVal

    print *, "Male minimum height:"
    call min(maleHeight, size(maleHeight), minVal)
    print *, minVal

    print *

    print *, "Female average height:"
    call avg(femaleHeight, size(femaleHeight), average)
    print *, average

    print *, "Female maximum height:"
    call max(femaleHeight, size(femaleHeight), maxVal)
    print *, maxVal

    print *, "Female minimum height:"
    call min(femaleHeight, size(femaleHeight), minVal)
    print *, minVal
end program height


module arithmetics

    contains

    subroutine avg(array, arraySize, average)
        implicit none
        real :: array(*)
        real:: average
        integer :: arraySize
        integer :: i

        average = 0
        do i = 1, arraySize
            average = average + array(i)/arraySize
        enddo
    end subroutine avg

    subroutine max(array, arraySize, maxVal)
        implicit none
        real :: array(*)
        real :: maxVal
        integer :: arraySize
        integer :: i

        maxVal = array(1)
        do i = 1, arraySize
            if (array(i) > maxVal) then
                maxVal = array(i)
            endif
        enddo
    end subroutine max

    subroutine min(array, arraySize, minVal)
        implicit none
        real :: array(*)
        real :: minVal
        integer :: arraySize
        integer :: i

        minVal = array(1)
        do i = 2, arraySize
            if (array(i) < minVal) then
                minVal = array(i)
            endif
        enddo
    end subroutine min

end module arithmetics