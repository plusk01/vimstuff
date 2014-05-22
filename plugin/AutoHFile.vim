function! AutoHFile( ) 

let l:file = toupper( substitute( expand( '%:t' ), '\.', '_', '' ).'_' )
let l:username=$USER

exe ":set paste"
exe "norm i#ifndef ".l:file."o#define ".l:file."oo#endif /* ".l:file." */k"
exe "norm o/*o * Author: ".l:username."o * created: ".strftime("%Y/%m/%d")
exe "norm o * ".expand( '%:t' ).": <description>o */oook"
exe ":set nopaste"

endfunction
