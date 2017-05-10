""""""""""""""""""
" Vundle options
"""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required
:let mapleader = "-"          " Maps - as leader character

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Navigation tree enhanced
Plugin 'scrooloose/nerdtree'
" Ctrl+p to search in the folder
" Remember to install the_silver_searcher
Plugin 'ctrlpvim/ctrlp.vim'
" Status bar
Plugin 'bling/vim-airline'
" Status bar custom colors
Plugin 'vim-airline/vim-airline-themes'
" Git integration
Plugin 'tpope/vim-fugitive'
" Custom color schemes
Plugin 'flazz/vim-colorschemes'
" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'
" Ruby extension, CTRL+N CTRL+P for autocomplete
Plugin 'vim-ruby/vim-ruby'
" Javascript syntax
Plugin 'pangloss/vim-javascript'
" Pops autocomplete instantly
" NOTE: remember to install the required libs
Plugin 'valloric/youcompleteme'
" Rspec integration
Plugin 'thoughtbot/vim-rspec'
" Tmux and Rspec integration
Plugin 'jgdavey/tslime.vim'
" Tmux pane easy navigation
Plugin 'christoomey/vim-tmux-navigator'
" Error checking
Plugin 'vim-syntastic/syntastic'
" Automatic end complete
Plugin 'tpope/vim-endwise'
" Haml and Scss
Plugin 'tpope/vim-haml'
" Better Comment handling
Plugin 'scrooloose/nerdcommenter'
" Vim snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Syntax highlighting, matching rules and mappings for Markdown files
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Faster motion movement with vim
Plugin 'easymotion/vim-easymotion'
" Easy quote and parenthesis
Plugin 'tpope/vim-surround'
" Sublime text like multiple selection
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be kadded before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Themes carousel
map <F4> :call NextDemoingSlide()<CR>
map <F3> :call PreviousDemoingSlide()<CR>

function! Carousel()
  for theme in split(globpath(&runtimepath, 'colors/*.vim'), '\n')
    let t = fnamemodify(theme, ':t:r')
    try
      execute 'colorscheme '.t
      echo t
    catch
    finally
    endtry
    sleep 4
    redraw
  endfor
endfunction
map <silent> <Leader>tc :call Carousel()<cr>

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
syntax enable                                             " Enables syntax highlight
" colorscheme molokai                                      " Color scheme
let g:solarized_termcolors=256                             " Solarized scheme
colorscheme solarized
set background=light

" AirLine
let g:airline_theme='simple'                              " Airline color scheme
let g:airline#extensions#syntastic#enabled = 1            " Syntastic integration
let g:airline#extensions#tabline#enabled = 1              " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'          " Show just the filename

" Hisory, cursor, rules
set number                                                "  to show the current line number
set ruler                                                 "  to show the rulers
set autoindent                                            " Automatically guess the indentation given the previous line inden
set showcmd                                               " Show current cursor info
set mouse=n                                               " Enable mouse movement Tabs and spaces
set nowrap                                                " no wrap spaces
set list                                                  " show invisible chars
set shiftwidth=2                                          " Use 2 space tabs by default
set softtabstop=2
set list                                                  " show invisible chars
set listchars=""                                          " Reset listchars
"set list listchars=tab:»·,trail:·                         " Set listchars for tabs and trailing spacesa
set expandtab                                             " Expand tabs into spaces
set laststatus=2                                          " Status bar always visible
set cursorline                                            " Highlight current cursor line
set hlsearch                                              " Automatically highlights search results, to hide them run :noh

" Snipmate
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" YouCompleteMe
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" Vim Markdown
let g:vim_markdown_folding_disabled = 1

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" Sets the global RSpec command
" If a vagrant_spec file exists sets up the command to run the spec with
" vagrant using as path the string given inside the file
"function! SetRSpecCommand()
  "if !empty(glob("vagrant_spec"))
    "let s:path =  join(readfile("vagrant_spec"), "\n")
    "let s:vagrant_cmd = 'cd '. s:path . '; bundle exec rspec --tag @focus -I . {spec}'
    "let g:rspec_command =  '!vagrant ssh -- -t "' . s:vagrant_cmd . '"'
  "else
    "let g:rspec_command = '!bundle exec rspec --tag @focus -I . {spec}'
  "endif
  "echo 'New RSpec run command: ' . g:rspec_command
"endfunction
"map <Leader>tr :call SetRSpecCommand()<CR>
" Rspec and Tmux setup, the first time will ask you for the session id to
" attach
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec --tag @focus -I . {spec}\n")'

" ctags
map <silent> <Leader>rt :call BuildCtags()<cr>

" Build ctags for ruby
function! BuildCtags()
  !ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
endfunction

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Buffer commands
nnoremap <Leader>e :buffers<CR>:buffer<Space>
" Map Alt + j
nmap ∆ :bprevious!<CR>
" Map Alt + k
nmap ¬ :bnext!<CR>
nmap <Leader>w :bp\|bd #<CR>                             " Closes buffer without closing the split view
map <Leader>c :!echo % \| pbcopy                         " Copy file name to clipboard

" Swap files
:set noswapfile             "disable swap files

" Use <S-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <S-L> :nohlsearch<CR>

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Tmux copy & paste MacOSX
set clipboard=unnamed

" Useful keywords to remember associated to Plugins:
" CTRL+p easy search for file names
" CTRL+SHIFT+] to jump to linked file such as CTRL+Click remember to rebuild CTAGS when needed with <Leader> rt
" CTRL+o for snippets
" Tab for autocomplete
" SHIFT+L clears search (nohls)
" <Leader><Leader>s to search in all the visible part of the file up and down with EasyMotion

" Setup notes:
" - you need vim with python support
" - you need to install CMake and then run cd ~/.vim/bundle/YouCompleteMe; ./install.py in order to install correctly YouCompleteMe
"
" Tips:
" to do find and replace: ag -l pattern | xargs -o vim   # and then do your
" bufdo %s/pattern/replace/gc | update
