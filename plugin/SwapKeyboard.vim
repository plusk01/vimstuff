function! SwapKeys()
    if ! exists('g:keymap')
        let g:keymap = 'qwerty'
    endif

    if g:keymap == 'qwerty'
        set keymap=dvorak
        let g:keymap = 'dvorak'
    elseif g:keymap == 'dvorak'
        set keymap=
        let g:keymap = 'qwerty'
    endif
endfunc
