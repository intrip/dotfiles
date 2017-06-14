" VimPlugged automatic install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
" Ctrl+p to search in the folder
" Remember to install the_silver_searcher
Plug 'ctrlpvim/ctrlp.vim'
" Status bar
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
" Rspec integration
Plug 'thoughtbot/vim-rspec'
" Tmux and Rspec integration
Plug 'jgdavey/tslime.vim'
" Tmux pane easy navigation
Plug 'christoomey/vim-tmux-navigator'
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

" set no compatibilty mode
set nocp

" Pops autocomplete instantly
" NOTE: remember to install the required libs
Plug 'Valloric/YouCompleteMe', { 'on': [] }
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| autocmd! load_us_ycm
augroup END
" Initialize plugin system
call plug#end()

:let mapleader = "-"          " Maps - as leader character

" The silver searcher
" use :Ag text path to search
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --path-to-ignore\ $HOME/.agignore

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind , (backward slash) to grep shortcut
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif
" Ctrl+P ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.jpeg,*.pdf,*.swf,*.bson

"""""""""""""""""""""""
" VIM OPTIONS BEGIN
"""""""""""""""""""""""

" Colorscheme
syntax enable                                             " Enables syntax highlight
"let g:solarized_termcolors=256                           " Enable this if you don't have the solarize theme installed for your terminal
colorscheme solarized
set background=light

" AirLine
let g:airline_theme='simple'                              " Airline color scheme
let g:airline#extensions#syntastic#enabled = 1            " Syntastic integration
let g:airline#extensions#tabline#enabled = 1              " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'          " Show just the filename

" Hisory, cursor, rules
set number                                                " to show the current line number
set ruler                                                 " to show the rulers
set autoindent                                            " Automatically guess the indentation given the previous line inden
set smartindent
set showcmd                                               " Show current cursor info
set mouse=a                                               " Enable mouse movement Tabs and spaces
set nowrap                                                " no wrap lines
" set list                                                " show invisible chars such as tabs and end of line
" set listchars="tab:->"                                  " Better looking tabs
highlight ExtraWhitespace ctermbg=red guibg=red           " Highilight trailing whitespaces
match ExtraWhitespace /\s\+$/
set expandtab                                             " Expand tabs into spaces
set laststatus=2                                          " Status bar always visible
set cursorline                                           " Highlight current cursor line
set hlsearch                                              " Automatically highlights search results, to hide them run :noh
set incsearch                                             " Makes search act like search in modern browsers
set shiftwidth=2                                          " Use 2 space tabs by default
set softtabstop=2
syntax sync minlines=256                                  " Only searches back 256 lines for indentation (better performance)
set encoding=utf-8                                        " Uses utf-8 encoding
set lazyredraw                                            " Don't redraw while executing macros (good performance config)
set lbr                                                   " Enables line break
set tw=200                                                " Breaks line at 200 chars
set noswapfile                                            " Disable swap file

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

" identantion spaces length depending on file format
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd filetype crontab setlocal nobackup nowritebackup

" UtilSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" YouCompleteMe
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" Vim Markdown
let g:vim_markdown_folding_disabled = 1

" NERDTree triggered with F9, use q to quit
map <F9> :NERDTree<cr>

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" Rspec and Tmux setup, the first time will ask you for the session id to
" attach
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec --tag @focus -I . {spec}\n")'

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

" Tagbar triggered with F8
nmap <F8> :TagbarToggle<CR>

" Buffer commands
nnoremap <Leader>e :buffers<CR>:buffer<Space>
" Map Alt + h
nnoremap ∆ :bprevious!<CR>
" Map Alt + l
nnoremap ¬ :bnext!<CR>
nmap <Leader>q :bp\|bd #<CR>                             " Closes buffer without closing the split view
nnoremap <Leader>c :!echo % \| pbcopy                    " Copy file name to clipboard
nnoremap <Leader>w :w<CR>                                " Fast file save
inoremap <Leader>w <Esc>:w<CR>

" Use <S-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <S-L> :nohlsearch<CR>

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Tmux copy & paste MacOSX and share clipboard
set clipboard=unnamed

" Move a line of text using <Leader>+[jk]
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
inoremap <Leader>j <Esc>:m .+1<CR>==gi
inoremap <Leader>k <Esc>:m .-2<CR>==gi
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv

" easy way to edit reload .vimrc
nmap <leader>V :source $MYVIMRC<cr>
nmap <leader>v :e $MYVIMRC<cr>

" Useful keywords to remember associated to Plugins:
" CTRL+p easy search for file names
" CTRL+SHIFT+] to jump to linked file such as CTRL+Click remember to rebuild CTAGS when needed with <Leader> rt
" Tab for snippetsautocomplete
" SHIFT+L clears search (nohls)
" <Leader><Leader>s to search in all the visible part of the file up and down with EasyMotion
" F8 to navigate methods
" F9 for NERDTree
" <Leader>ci to toggle comment

" Setup notes:
" - you need vim with python support
" - you need to install CMake and then run cd ~/.vim/bundle/YouCompleteMe; ./install.py in order to install correctly YouCompleteMe
" - in order to use the truecolor version of solarized you need to setup " solarized scheme for your terminal: http://ethanschoonover.com/solarized
"
" Tips:
" to do find and replace: ag -l pattern | xargs -o vim   # and then do your
" bufdo %s/pattern/replace/gc | update
