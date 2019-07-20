let g:vimrc#project_root_markers = ['.git']

function! vimrc#get_buffer_path()
  if exists('b:defx')
    return b:defx.paths[0]
  endif
  if exists('t:deol') && &filetype ==# 'deol'
    return t:deol.cwd
  endif
  return expand('%:p')
endfunction

function! vimrc#get_project_root(...)
  let path = get(a:000, 0, vimrc#get_buffer_path())
  let path = fnamemodify(path, ':p')
  while path !=# ''
    for marker in g:vimrc#project_root_markers
      let candidate = resolve(path . '/' . marker)
      if filereadable(candidate) || isdirectory(candidate)
        return path
      endif
    endfor
    let path = substitute(path, '/[^/]*$', '', 'g')
  endwhile
  return ''
endfunction

function! vimrc#detect_cwd()
  let path = vimrc#get_buffer_path()
  let root = vimrc#get_project_root()
  let cwd = filereadable(path) ? root : path

  if exists('b:defx')
    call defx#call_action('add_session', [cwd])
  endif

  if dein#tap('neomru.vim')
    call neomru#append(cwd)
  endif

  call vimrc#set_cwd(cwd)
endfunction

function! vimrc#set_cwd(cwd)
  let t:cwd = a:cwd
endfunction

function! vimrc#get_cwd()
  if strlen(get(t:, 'cwd', '')) > 0
    return t:cwd
  endif
  return vimrc#get_project_root()
endfunction

function! vimrc#trim_right(str, trim)
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction
