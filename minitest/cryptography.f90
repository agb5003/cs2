module cryptography
    character(len=1) :: reverse_cipher(26)

    contains

    subroutine substitute_cipher(input_text, output_text, len, cipher_map, encrypt)
        implicit none
        character(len=100), intent(in) :: input_text
        character(len=100), intent(out) :: output_text
        character(len=1) :: cipher_map(26)
        integer :: len
        logical encrypt

        integer :: i
        integer :: cipherIndex ! 1 + offset from the ascii value of 'a'

        if (encrypt) then
            ! String encryption
            do i = 1, len
                if (iachar(input_text(i:i)) >= 97 .and. iachar(input_text(i:i)) <= 97+25) then
                    cipherIndex = iachar(input_text(i:i)) - iachar('a') + 1
                    output_text(i:i) = cipher_map(cipherIndex)
                else
                    output_text(i:i) = input_text(i:i)
                endif
            enddo
        else
            ! String decryption
            call constructReverseCipher(cipher_map, reverse_cipher)
            do i = 1, len
                if (iachar(input_text(i:i)) >= 97 .and. iachar(input_text(i:i)) <= 97+25) then
                    cipherIndex = iachar(input_text(i:i)) - iachar('a') + 1
                    output_text(i:i) = reverse_cipher(cipherIndex)
                else
                    output_text(i:i) = input_text(i:i)
                endif
            enddo
        endif

    end subroutine substitute_cipher

    subroutine constructReverseCipher(cipher_map, reverse_cipher)
        character(len=1) :: cipher_map(26)
        character(len=1) :: reverse_cipher(26)
        integer :: i

        do i = 1, 26
            reverse_cipher(iachar(cipher_map(i:i)) - iachar('a') + 1) = achar(iachar('a') + i - 1)
        enddo

        print *, "Reverse cipher: ", reverse_cipher


    end subroutine constructReverseCipher

end module cryptography