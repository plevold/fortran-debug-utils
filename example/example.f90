module example_mod
    implicit none

    private
    public some_pure_sub

contains

    pure subroutine some_pure_sub()

        block
            use debug_utils, only: dbg
            call dbg('Hello from some_pure_sub' // new_line('c')  &
                    // 'This can be useful for debugging pure procedures')
        end block
    end subroutine

end module

program example
    use example_mod, only: some_pure_sub
    implicit none

    write(*,'(a)') 'Before pure sub'
    call some_pure_sub
    write(*,'(a)') 'After pure sub'
end program