if has('nvim')
    let g:session_extension = '.shada'
else
    let g:session_extension = '.vim'
endif

let g:sessions_directory = expand('~/.vim/.sessions')
let g:session_default_name = 'Session'
