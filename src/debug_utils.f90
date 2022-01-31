module debug_utils
    implicit none

    private
    public dbg


    interface
        !> Write text to stdout, even from pure and elemental procedures
        !! Only intended for debugging, NOT for production code!
        pure module subroutine dbg(message, header)
            !> Message to be written
            character(len=*), intent(in) :: message
            !> Should a [debug] header be included? Default: True
            logical, optional, intent(in) :: header
        end subroutine
    end interface

end module