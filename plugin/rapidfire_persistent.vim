if exists('g:rapidfire_persistent_loaded')
  finish
endif
let g:rapidfire_persistent_loaded = 1

augroup rapidfire_persistent_internal
  autocmd! *
  autocmd VimEnter * call rapidfire_persistent#load()
  autocmd User RapidfirePost call rapidfire_persistent#save()
augroup END
