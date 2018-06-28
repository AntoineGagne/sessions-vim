function! sessions#SaveSession(save_session, generate_filename)
    let session_path = GetSessionCurrentPath()
    call CreateDirectoryIfItDoesNotExists(session_path)
    let filename = a:generate_filename()
    if !exists('filename')
        let filename = g:session_default_name
    endif
    let session_file = join([session_path, filename], '/')
    let session_file = session_file . g:session_extension
    execute a:save_session fnameescape(session_file)
endfunction

function! sessions#LoadSession(load_session, filename)
    execute a:load_session fnameescape(a:filename)
endfunction

function! sessions#GetSessions()
    let session_path = GetSessionCurrentPath()
    return split(globpath(session_path, '*'), '\n')
endfunction

function! GetSessionCurrentPath()
    let working_directory = fnamemodify(getcwd(), ":t")
    return join([g:sessions_directory, working_directory], '/')
endfunction

function! CreateDirectoryIfItDoesNotExists(directory_name)
    if !isdirectory(a:directory_name)
        call mkdir(a:directory_name, "p", 0700)
    endif
endfunction
