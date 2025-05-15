! Computer Seminar II
! Exercise 4.7
! Maximilian Fernaldy

program freefall
    ! Parameters
    real, parameter :: t_initial = 0.
    real, parameter :: t_final = 10.
    real, parameter :: v_initial = 0.
    
    
    real :: position = 0.
    real :: velocity = v_initial
    real :: time = t_initial
    real :: k_1
    real :: k_2

    integer, parameter :: N = 50
    real, parameter :: deltaT = (t_final - t_initial)/N
    integer :: i

    do i = 1, N
        position = position + velocity * deltaT
        
        k_1 = velFunc(time, velocity) * deltaT
        k_2 = velFunc(time + deltaT/2, velocity + deltaT * k_1/2) * deltaT
        velocity = velocity + 0.5 * (k_1 + k_2)

        time = time + deltaT

        print *, "Time = ", time, "Position = ", position, "Velocity = ", velocity
    end do
end program

real function velFunc(time, velocity)
    implicit none
    real :: time
    real :: velocity

    real, parameter :: grav = 9.8
    real, parameter :: mass = 1.
    real, parameter :: coef_drag = 2.

    velFunc = -grav - (coef_drag/mass) * velocity
end function