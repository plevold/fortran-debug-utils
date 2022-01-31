submodule(debug_utils) dbg_impl
    implicit none

    interface
        pure subroutine debug_utils__print(message)
            character(len=*), intent(in) :: message
        end subroutine
    end interface

contains

    pure subroutine dbg(message, header)
        character(len=*), intent(in) :: message
        logical, optional, intent(in) :: header

        logical :: is_header

        is_header = .true.
        if (present(header)) is_header = header

        if (is_header) then
            call debug_utils__print('[debug] ' // new_line('c')   &
                    // '    ' // indent_newlines(message, 4))
        else
            call debug_utils__print(message)
        end if
    end subroutine


    recursive pure function indent_newlines(chars, n) result(indented)
        character(len=*), intent(in) :: chars
        integer, intent(in) :: n
        character(len=:), allocatable :: indented

        integer :: idx

        idx = index(chars, new_line('c'))
        if (idx <= 0) then
            indented = chars
        else
            indented = chars(1:idx)    &
                // repeat(' ', n) // indent_newlines(chars(idx + 1:), n)
        end if
    end function
end submodule


subroutine debug_utils__print(message)
    character(len=*), intent(in) :: message

    write(*, '(a)') message
end subroutine
