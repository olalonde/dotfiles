call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline' " Status bar
Plug 'mhartington/oceanic-next' " Theme
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim' " Cross editor config
Plug 'w0rp/ale' " ALE, better than Syntastic
Plug '/usr/local/opt/fzf' " fuzzy file search
" https://github.com/airblade/vim-gitgutter/issues/555
" Plug 'airblade/vim-gitgutter' " see git diffs in gutter
Plug 'mhinz/vim-grepper' " :Grepper command
Plug 'tpope/vim-unimpaired' " convenient bindings to navigate quickfix window
Plug 'Xuyuanp/nerdtree-git-plugin' " show git files status in nerdtree
" Language support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
call plug#end()

""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set hidden            " allow to hide buffer with unsaved changes

set diffopt+=vertical " side by side diffs by default

" see https://github.com/mathiasbynens/dotfiles/blob/master/.vimrc
set clipboard=unnamed        " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu                 " Enhance command-line completion
set ttyfast                  " Optimize for fast terminal connections
set gdefault                 " Add the g flag to search/replace by default
set binary
set noeol                    " Don’t add empty newlines at the end of files

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
set mouse=a       " Enable mouse in all modes
set noerrorbells  " Disable error bells
set nostartofline " Don’t reset cursor to start of line when moving around.
set shortmess=atI " Show the cursor position
set showmode      " Show the current mode
set title         " Show the filename in the window titlebar set showcmd       " Show the (partial) command as it’s being typed set scrolloff=3   " Start scrolling three lines before the horizontal window border
""
"" Text formatting
""

"set formatoptions+=a "Automatic formatting of paragraphs
"oops, this should only be used for .md or .txt files!
set formatoptions+=n "Recognize numbered list when formatting

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen


""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

" Files to ignore when expanding using wildcard

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*


""
"" File types
""

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  autocmd FileType make setlocal noexpandtab

  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set ft=ruby

  autocmd BufRead,BufNewFile *.snap set ft=javascript

  " Make sure all mardown files have the correct filetype set and setup wrapping
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set ft=markdown | call s:setupWrapping()

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
endif


""
"" Status line
""

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

""
"" Mappings
""

let mapleader="," " Change mapleader

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" format the entire file
nmap <leader>fef ggVG=

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"<CR>


""
"" Status line
""

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

""
"" Mappings
""

"let mapleader="\\" " Change mapleader
let mapleader="," " Change mapleader

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" format the entire file
nmap <leader>fef ggVG=

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

""
"" Configure plugins
""
" Grepper
"" dont interpret options
nmap <silent> <leader>fg :Grepper<CR>

" Theme
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" https://github.com/ntpeters/vim-better-whitespace
" Remove trailing white space on save
autocmd BufWritePre * StripWhitespace

""
"" Plugin configuraation
""

"" fzf
nmap <silent> <leader>ff :FZF<CR>

"" NERDTree

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
nmap <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" https://github.com/scrooloose/nerdtree/issues/21#issuecomment-907483
" Auto close vim if nerdtree last buffer left
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

"" Gitgutter

