" VimPlugged automatic install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
" Fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
" Status bar, remember to install the patched powerline fonts: https://github.com/powerline/fonts
Plug 'bling/vim-airline'
" Status bar custom colors
Plug 'vim-airline/vim-airline-themes'
" Git integration
Plug 'tpope/vim-fugitive'
" Custom color schemes
Plug 'flazz/vim-colorschemes'
" Solarized color scheme
Plug 'altercation/vim-colors-solarized'
" Ruby extension
Plug 'vim-ruby/vim-ruby'
" Javascript syntax
Plug 'pangloss/vim-javascript'
" Error checking
Plug 'vim-syntastic/syntastic'
" Automatic end complete
Plug 'tpope/vim-endwise'
" Haml and Scss
Plug 'tpope/vim-haml'
" Better Comment handling
Plug 'scrooloose/nerdcommenter'
" Vim snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Syntax highlighting, matching rules and mappings for Markdown files
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Easy quote and parenthesis
Plug 'tpope/vim-surround'
" Vim method navigation with CTAGS
Plug 'majutsushi/tagbar'
" JSON formatting
Plug 'elzr/vim-json'
" Golang extension
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Extension to vim session
Plug 'tpope/vim-obsession'
" Enables FocusLost and FocusGained events
Plug 'sjl/vitality.vim'
" Ruby folding
Plug 'bruno-/vim-ruby-fold'
" Rspec folding
Plug 'rlue/vim-fold-rspec'
" Run async commands in the quickfix windows
Plug 'skywind3000/asyncrun.vim'
" Handles test interaction with many backends
Plug 'janko-m/vim-test'
" Ag search like
Plug 'mileszs/ack.vim'
" Rails vim integration
Plug 'tpope/vim-rails'
" Allow to quick jump between files, use :A to jump to the spec for example
Plug 'tpope/vim-projectionist'
" Easy jump between files in the current directory
Plug 'tpope/vim-vinegar'
" Integrates bundler with Bopen or Bundle
Plug 'tpope/vim-bundler'
" Dim inactive windows
Plug 'blueyed/vim-diminactive'
" Autoclose HTML tags
Plug 'alvan/vim-closetag'

augroup END
" Initialize plugin system
call plug#end()

"""""""""""""""""""""""
" VIM OPTIONS BEGIN
"""""""""""""""""""""""

let mapleader = "-"          " Maps - as leader character

" Colorscheme
"let g:solarized_termcolors=256                           " Enable this if you don't have the solarize theme installed for your terminal e.g. Iterm
colorscheme solarized
set background=dark

set nocp                                                  " Set no compatibilty mode
set encoding=utf-8                                        " Uses utf-8 encoding
set noswapfile                                            " Disable swap file
set nobackup                                              " Don't backup
set nowritebackup                                         " Write file in place
set autoread                                              " Automatically reload file changes
set autowriteall                                          " Automatically save buffers.
autocmd WinLeave * silent! wall                           " Automatically save changes before switching windows
autocmd FocusLost * silent! wall                          " Automatically save changes when loosing focus
syntax enable                                             " Enables syntax highlight
syntax sync minlines=256                                  " Only searches back 256 lines for indentation (better performance)
set lazyredraw                                            " Speedup buf loading

" Ruby folding
let g:ruby_fold_lines_limit = 200   "limits max folding to 200
" automatically unfolds all items on open
autocmd BufWinEnter * normal zR

" Hisory, cursor, rules
set history=100                                           " Remember last 100 commands
set laststatus=2                                          " Status bar always visible
set number                                                " to show the current line number
set showcmd                                               " Show current cursor info
set mouse=a                                               " Enable mouse movement Tabs and spaces
set cursorline                                            " Highlight current cursor line
let &t_SI = "\<Esc>]50;CursorShape=1\x7"                  " Thin cursor shape in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"                  " Fat cursor shape in normal mode

" Tabs and white spaces
set nowrap                                                " No wrap lines
set shiftwidth=2                                          " Use 2 space tabs by default
set softtabstop=2
set expandtab                                             " Expand tabs into spaces
" we use ascii chars because special chars are slow on OSX, ref: https://github.com/tpope/vim-sensible/issues/57
"set listchars=eol:⏎,tab:␉·,trail:·,nbsp:⎵                 " Highligth special characters and trailing whitespaces
set listchars=tab:>\ ,trail:-,nbsp:_,precedes:<           " Highligth special characters and trailing whitespaces
set list                                                  " Activates highlight
set tw=200                                                " Breaks line at 200 chars
set lbr                                                   " Enables line break
set splitright                                            " Always open vsplit to the right

" Indentation
set autoindent                                            " Automatically guess the indentation given the previous line inden
set smartindent

" Search
set hlsearch                                              " Automatically highlights search results, to hide them run :noh
set incsearch                                             " Makes search act like search in modern browsers
set ignorecase                                            " Searches are case insensitive...
set smartcase                                             " ... unless they contain at least one capital letter

" highlight the 101 column
"set colorcolumn=101
"highlight ColorColumn ctermbg=236

set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Identantion spaces length depending on file format
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go specific settings
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go set nolist

" Crontab specific settings
autocmd filetype crontab setlocal nobackup nowritebackup

" Define what to save with :mksession
" blank - empty windows
" buffers - all buffers not only ones in a window
" curdir - the current directory
" folds - including manually created ones
" help - the help window
" options - all options and mapping
" winsize - window sizes
" tabpages - all tab pages
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,tabpages

" Vue JS syntax
autocmd BufNewFile,BufRead *.vue set syntax=javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Quick switch between numbers ruler
noremap <silent> <F12> :set number!<CR>

" Buffer commands
" Map Alt + h
nnoremap ∆ :bprevious!<CR>
" Map Alt + l
nnoremap ¬ :bnext!<CR>
nmap <Leader>w :bp\|bd #<CR>                             " Closes buffer without closing the split view
nmap <Leader>q :%bd\|e# <CR>                             " Closes all buffer except current
" Copy file name to clipboard
nnoremap <Leader>c :!echo -n % \| pbcopy<CR>

" Changes window with CTRL+H,J,K,L
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Next/prev result with up and down arrows
map <down> :cn<CR>
map <up> :cp<CR>

" Use <S-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <S-L> :nohlsearch<CR>

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Move a line of text up and down using <Leader>+[jk]
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
inoremap <Leader>j <Esc>:m .+1<CR>==gi
inoremap <Leader>k <Esc>:m .-2<CR>==gi
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv

" easy way to edit reload .vimrc
nmap <Leader>V :source $MYVIMRC<cr>
nmap <Leader>v :e $MYVIMRC<cr>

" <F2> Copy the current line in normal mode and the selected text in visual mode
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <F9> :call ToggleList("Quickfix List", 'c')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN OPTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" AirLine
let g:airline_theme='solarized'                              " Airline color scheme
let g:airline#extensions#syntastic#enabled = 1            " Syntastic integration
let g:airline#extensions#tabline#enabled = 1              " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'          " Show just the filename
let g:syntastic_quiet_messages = { 'regex': 'SC2148' }    " Turn of some warnings, check out: https://stackoverflow.com/questions/28282315/how-can-i-turn-off-specific-messages-in-syntastic-vim
let g:airline_powerline_fonts = 1                         " Allows the fancy powerline fonts

" UtilSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Vim Markdown
let g:vim_markdown_folding_disabled = 1

" NERDTree triggered with F8
map <F8> :NERDTreeToggle<cr>
" NERDTree in current directory triggered with F7
map <F7> :NERDTreeFind<cr>
let NERDTreeMapUpdir='-'

" Tagbar triggered with F10
nmap <F10> :TagbarToggle<CR>

" Ctags
map <silent> <Leader>rt :call BuildCtags()<cr>

" Build Ctags for ruby
function! BuildCtags()
  !ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
endfunction

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" RSpec.vim mappings
map <Leader>e :TestFile <CR>
map <Leader>s :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>a :TestSuite<CR>
let test#strategy = "asyncrun"

" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Searches word under cursor with Ack
nnoremap <silent> K :call SearchWordWithAg()<CR>
function! SearchWordWithAg()
  execute 'Ack' expand('<cword>')
endfunction

" CtrlP
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Projectionist
if exists("g:loaded_projectionist")
  let g:projectionist_heuristics['*.go'] = {
      \ '*.go': { 'alternate': '{}_test.go', 'type': 'source' },
      \ '*_test.go': { 'alternate': '{}.go', 'type': 'test' }
      \ }
endif

" Vim autoclose
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" DOCS
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" :Ack to search files, press up and down to swap between results
" K to search with Ack the word under cursor
" :Ag to search in files like with Ctrl+p
" Ctrp+p for fuzzy search files from name
" Useful keywords to remember associated to Plugins:
" CTRL+] to jump to linked file such as CTRL+Click, remember to rebuild CTAGS when needed with <Leader> rt,
" you can jump back with CTRL+SHIFT+[ or CTRL+T. With g + CTRL+] you see the list of all the tags associated
" SHIFT+L clears search (nohls)
" F10 to navigate methods
" F10 to toggle quickfix window
" F8 for NERDTree
" F7 for NERDTree in current buffer folder
" F12 for line number
" <Leader>ci or space to toggle comment
" gf to open the related file
" :A or :AV to open/open in vsplit the alternate file for example the spec
" CTRL+O CTRL+I to move between cursor jumps
" use * to go to next occurrence of the word under cursor

" Setup notes:
" - in order to use the truecolor version of solarized you need to setup " solarized scheme for your terminal: http://ethanschoonover.com/solarized
" - you need to install the_silver_searcher
" - in order to have persistent undo run: mkdir ~/.vim/undo
"
" Tips:
" to do find and replace: ag -l pattern | xargs -o vim   # and then do your
" bufdo %s/pattern/replace/gc | update
" prepend with silent if you need to mass replace
" to create a markdown document: showdown makehtml -i tc_ui.md -o tc_ui.html
" rename html tag: cstt
