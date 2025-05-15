! Computer Seminar II
! Exercise 4.6
! C2TB1702
! Maximilian Fernaldy

! The determinant of a matrix can be calculated in several ways. By far the two most prevalent
! algorithms used in programs are the Leibniz formula (computed with the Laplace expansion) and
! the Gaussian elimination. I will use the Gaussian elimination method in this exercise as it
! is more efficient for large matrices. The formal definition and mathematical expression can
! be found here:
! https://en.wikipedia.org/wiki/Gaussian_elimination#Computing_determinants:~:text=of%20the%20algorithm.-,Computing%20determinants,-%5Bedit%5D

program determinant
    double precision :: mat(3, 3) = reshape([0., 2., 3., 1., 4., 5., 6., 7., 8.], shape=[3, 3])! The 3x3 matrix
    double precision :: temp_row(size(mat(1,:)))
    double precision :: det ! The determinant
    double precision :: coef

    integer :: i
    integer :: j

    integer :: max_row
    integer :: num_swaps = 0

    ! Go through the rows of the matrix
    do i = 1, size(mat(:,1))
        ! Find the row with the largest absolute value in column i
        max_row = i
        do j = i+1, size(mat(:,1))
            if (abs(mat(j,i)) > abs(mat(max_row,i))) then
                max_row = j
            endif
        end do

        ! Swap the rows if necessary
        if (max_row /= i) then
            temp_row = mat(i,:)
            mat(i,:) = mat(max_row,:)
            mat(max_row,:) = temp_row
            num_swaps = num_swaps + 1
        endif

        ! Proceed with elimination
        do j = i+1, size(mat(:,1))
            if (mat(j,i) /= 0.0) then
                coef = mat(j,i)/mat(i,i)
                mat(j,:) = mat(j,:) - coef * mat(i,:)
            endif
        end do
    end do

    det = mat(1,1)
    do i = 2, size(mat(1,:))
        det = det * mat(i, i)
    enddo
    if (mod(num_swaps, 2) /= 0) det = -det ! swap polarity if number of swaps is odd

    print *, det

end program