set encoding=utf-8
syntax on

" Load plugins with pathogen
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

colorscheme ir_black

" gutter
set cursorline
set number

" Show a vertical line at 80 characters
if exists('+colorcolumn')
  set cc=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Spacing
" set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set gfn=Inconsolata-dz:h12

" Display tabs, whitespace and extenions
set listchars=tab:\ \ ,trail:·,extends:>,precedes:\<
set list

" Status bar stuff
set laststatus=2
set statusline=%.50F%m%r%h%w
set statusline+=\ %y " filetype
set statusline+=[%l/%L:%v]  " row,column, percent
set statusline+=%= "Make the rest right split
set statusline+=%{fugitive#statusline()} " git status from fugative

" Puts in syntastic warnings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" default the statusline when entering Vim
hi statusline ctermbg=DarkGrey guibg=DarkGrey ctermfg=7* guifg=White

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Blue ctermfg=0 guifg=White ctermbg=4
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermbg=DarkGrey guibg=DarkGrey ctermfg=7* guifg=White


" use jk for escape
inoremap jk <ESC>

" Press F4 to toggle highlight search
:noremap <F4> :set hlsearch! hlsearch?<CR>

"Faster shortcut for commenting with TComment"
map <leader>c <c-_><c-_>

" Map F5 as a re-load of file system for Command T"
noremap <F5> :CommandTFlush<CR>

" Open system color picker (install from
" https://github.com/jnordberg/color-pick
inoremap <C-X>c #<C-R>=system('colorpick')<CR>

" easier nerdtree
noremap <leader>nt :NERDTreeToggle<CR>

" hubdown
map :hub :!hubdown % -w <bar> browser<CR>

" open file in Sublime
map :subl :!subl %<CR>

" run rspec on current file
noremap <leader>rt :!bundle exec rspec %<CR>

" run rspec for curren line
noremap <leader>lt :!bundle exec rspec % -l <C-r>=line('.')<CR><CR>

" run spec on current file
noremap <leader>rs :!bundle exec spec %<CR>
noremap <leader>ls :!bundle exec spec % -l <C-r>=line('.')<CR><CR>

" Mustacher - Handlebars
let g:mustache_abbreviations = 1
au BufRead,BufNewFile {*.hbs,*.handlebars} set ft=handlebars

" These are all actually ruby files
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,config.ru,*.gemspec} set ft=ruby

" es6 as js
au BufNewFile,BufRead *.es6 set filetype=javascript

" au BufRead,BufNewFile {*.md} set ft=markdown
augroup markdown
  au!
  " au BufRead,BufNewFile {*.md, *.markdown} set ft=ghmarkdown
  au BufRead,BufNewFile *.md,*.markdown set ft=ghmarkdown
augroup END

" gist.vim settings
" filetype from gist name
let g:gist_detect_filetype = 1

" open gist in browser after post
let g:gist_open_browser_after_post = 1

" private gists by default
let g:gist_post_private = 1
