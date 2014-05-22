" Pushes a file to a server
function! WritePush( server, ... )
    if a:0 > 0
        let l:folder=a:1
    else
        let l:folder="/home/".$USER."/.vimbackup"
    endif

    " Get the hostname of the client machine
    let l:hostname=substitute( system("cat /etc/hostname"), '\n', '', 'g' )
    " Get the current time
    " I have 1 min granularity
    let l:time=strftime("%Y%m%d_%H%M")
    " The files is $(hostname)/$(time/date)_$(filebasename).gz
    let l:file=l:hostname."/".l:time."_".substitute( expand('%:t'), '^\.', '', '' ).".gz"
    " The command to run
    let l:cmd="w !ssh ".a:server." \"(mkdir -p ".l:folder."'/".l:hostname."' ; gzip > '".l:folder."/".l:file."')\""
    " echo a message
    echo "Saving to: ".l:file
    " echo the command
    echo l:cmd
    " write it to an ssh command that gzips and saves the file
    exe l:cmd

endfunction
