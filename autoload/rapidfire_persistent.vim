function! rapidfire_persistent#save() abort
  let filename = fnamemodify(expand(g:rapidfire_persistent#filename), ':p')
  call mkdir(fnamemodify(filename, ':h'), 'p', 0700)
  call writefile([json_encode(g:rapidfire#commands)], filename)
endfunction

function! rapidfire_persistent#load() abort
  let filename = fnamemodify(expand(g:rapidfire_persistent#filename), ':p')
  let g:rapidfire#commands = json_decode(join(readfile(filename), "\n"))
endfunction


let g:rapidfire_persistent#filename = get(
      \ g:,
      \ 'rapidfire_persistent#filename',
      \ '~/.cache/rapidfire_persistent/commands.json',
      \)
