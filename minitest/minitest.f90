! Computer Seminar II Minitest
! C2TB1702
! Maximilian Fernaldy

program minitest
    use cryptography
    implicit none
    
    character(len=100) :: input_text, output_text
    character(len=1) :: cipher_map(26)
    character(len=1) :: letter

    integer :: freq(26), len, count
    logical :: encrypt = .false.


    cipher_map = ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm']

    input_text = "the quick brown fox jumps over the lazy dog."
    len = len_trim(input_text)

    freq = 0
    call frequency_analysis(input_text, len, freq)

    call most_frequent(freq, letter, count)

    encrypt = .true.
    call substitute_cipher(input_text, output_text, len, cipher_map, encrypt)
    print *, "Encrypted text: ", output_text(1:len)

    ! to prove that we have actually decrypted the text, and not simply printing the old value of
    ! `input_text`, let's set `input_text` to something else:
    input_text = "something else!"
    print *, "Modified input_text to ", input_text

    encrypt = .false.
    call substitute_cipher(output_text, input_text, len, cipher_map, encrypt)
    print *, "Decrypted text: ", input_text(1:len)

    ! If the output of the above print statement is equal to the initial value we set `input_text`
    ! to, then we have truly succeeded.

    stop
end program minitest

subroutine frequency_analysis(input_text, len, freq)
    implicit none
    integer :: len
    character(len=len) :: input_text
    integer :: freq(*)

    integer :: i ! counter for string iteration
    integer :: charIndex ! index of letter frequency to increment

    do i = 1, len
        ! subtract by the ascii code for 'a' and add 1 for the index
        charIndex = iachar(input_text(i:i)) - iachar('a') + 1
        freq(charIndex) = freq(charIndex) + 1
    enddo

    do i = 1, 26
        print *, achar(i + iachar('a') - 1), ": ", freq(i)
    enddo

end subroutine frequency_analysis

subroutine most_frequent(freq, letter, count)
    implicit none
    integer :: freq(*)
    character(len=1) :: letter
    integer :: count
    integer :: i
    integer :: currentMaxIndex

    currentMaxIndex = 0
    count = 0
    do i = 1, 26
        if (freq(i) > count) then
            count = freq(i)
            currentMaxIndex = i
        endif
    enddo

    letter = achar(currentMaxIndex + iachar('a') - 1)
    print *, "Most frequent letter: ", letter, " (", count, " times)"
end subroutine most_frequent