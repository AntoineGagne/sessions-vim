function! SaveSession()
    let session_path = join([g:sessions_directory, fnamemodify(getcwd(), ":t")], '/')
    call CreateDirectoryIfItDoesNotExists(session_path)
    let session_file = join([session_path, GetGitBranchName()], '/')
    execute 'mksession' fnameescape(session_file)
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
