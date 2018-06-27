if has('nvim')
    let g:session_extension = '.shada'
    let g:save_session = 'wshada'
    let g:restore_session = 'rshada'
else
    let g:session_extension = '.vim'
    let g:save_session = 'mksession'
    let g:restore_session = 'source'
endif

let g:sessions_directory = expand('~/.vim/.sessions')
let g:session_default_name = 'Session.vim'
