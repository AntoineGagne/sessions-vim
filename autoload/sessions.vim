function! SaveSession(save_session, generate_filename)
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

function! LoadSession(load_session, filename)
    execute a:load_session fnameescape(a:filename)
endfunction

function! GetSessions()
    let session_path = join([g:sessions_directory, fnamemodify(getcwd(), ":t")], '/')
    return split(globpath(session_path, '*'), '\n')
endfunction

function! GetGitBranchName()
    let current_branch = system("git symbolic-ref -q --short HEAD")

    return Chomp(current_branch)
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

function! Chomp(string)
    return substitute(a:string, '[[:cntrl:]]', '', 'g')
endfunction
