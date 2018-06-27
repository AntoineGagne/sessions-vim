function! SaveSession(generate_filename, force)
    let session_path = join([g:sessions_directory, fnamemodify(getcwd(), ":t")], '/')
    call CreateDirectoryIfItDoesNotExists(session_path)
    let session_file = join([session_path, a:generate_filename()], '/')
    call WriteSession(fnameescape(session_file . g:session_extension), a:force)
endfunction

function! WriteSession(filename, force)
    let write_command = CreateForcedCommand(g:save_session, a:force)
    execute write_command a:filename
endfunction

function! LoadSession(filename, force)
    let read_command = CreateForcedCommand(g:restore_session, a:force)
    execute read_command a:filename
endfunction

function! GetGitBranchName()
    let current_branch = fnameescape(system("git symbolic-ref -q --short HEAD"))
    if !exists('current_branch')
        let current_branch = g:default_name
    endif

    return current_branch
endfunction

function! CreateDirectoryIfItDoesNotExists(directory_name)
    if !isdirectory(a:directory_name)
        call mkdir(a:directory_name, "p", 0700)
    endif
endfun

function! CreateForcedCommand(command, force)
    let updated_command = a:command
    if a:force
        let updated_command = updated_command . '!'
    endif

    return updated_command
endfunction
