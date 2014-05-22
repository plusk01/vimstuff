" Convinience function for toggling
" between hex and normal mode
function! ToggleHexMode()
    " Make a variable to detect the current
    " state of the buffer
    if !exists('b:in_hex_mode') 
        let b:in_hex_mode = 0
    endif

    if b:in_hex_mode == 0
        " If the buffer is not in hex mode,
        " we must save the state and transition
        " to hex mode
        let b:in_hex_mode = 1
        let b:HexModeSaveLine=line('.')
        let b:HexModeSaveCol=col('.')

        " set up some basic syntax highlighting
        exe 'syn match hexNumber "[0-9a-f]\{4\}" contained'
        exe 'syn match hexAddress "^[0-9a-f]*:" contained'
        exe 'syn region hexBlock start="^" end="  " contains=hexNumber,hexAddress'
        exe 'hi  hexNumber ctermfg=35'
        exe 'hi  hexAddress ctermfg=240'

        " make the leap
        exe "%!xxd"
    else
        " If we are not in hex mode, then we need to
        " switch back and exit hex mode
        let b:in_hex_mode = 0

        syn off
        " Exit back to normal mode
        exe "%!xxd -r"
        syn on

        " Restore the saved cursor pointer
        call cursor( b:HexModeSaveLine, b:HexModeSaveCol )
    endif

endfunction
