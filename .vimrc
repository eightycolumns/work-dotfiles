filetype on

function SetTabs()
  set tabstop=8

  if &filetype == 'gitconfig' || &filetype == 'make'
    set softtabstop=8 shiftwidth=8 noexpandtab
  elseif &filetype == 'python'
    set softtabstop=4 shiftwidth=4 expandtab
  else
    set softtabstop=2 shiftwidth=2 expandtab
  endif
endfunction

autocmd BufRead,BufEnter * call SetTabs()

set t_Co=0
syntax off

set relativenumber
set scrolloff=999
set numberwidth=3
highlight LineNr term=NONE

set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set fillchars=
set formatoptions=
set incsearch
set listchars=eol:$,tab:+-
set nohlsearch
set nojoinspaces
set nowrap
set ruler
set shell=/bin/bash
set splitbelow
set splitright
set t_md=
set timeoutlen=0

noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>

noremap! <Left> <Nop>
noremap! <Down> <Nop>
noremap! <Up> <Nop>
noremap! <Right> <Nop>

function TrimTrailingWhitespace()
  if &filetype == 'markdown'
    return
  endif

  let pos = getpos('.')
  %s,\s\+$,,e
  call setpos('.', pos)
endfunction

autocmd BufWrite * call TrimTrailingWhitespace()
