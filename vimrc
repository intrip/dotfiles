" VimPlugged automatic install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" File navigation
Plug 'scrooloose/nerdtree'
" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Status bar, remember to install the patched powerline fonts: https://github.com/powerline/fonts
Plug 'bling/vim-airline'
" Status bar custom colors
Plug 'vim-airline/vim-airline-themes'

" Git integration
Plug 'tpope/vim-fugitive'
" Show diff from a ref
Plug 'airblade/vim-gitgutter'

" Custom color schemes
Plug 'flazz/vim-colorschemes'
" Solarized color scheme
Plug 'altercation/vim-colors-solarized'
" Cool dev icons
Plug 'ryanoasis/vim-devicons'

" Ruby
Plug 'vim-ruby/vim-ruby'
" Rails
Plug 'tpope/vim-rails'
" Javascript
Plug 'pangloss/vim-javascript'
" Haml and Scss
Plug 'tpope/vim-haml'
" Golang extension
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" C ruby
Plug 'mrkn/vim-cruby'
" Vue.js integration
Plug 'posva/vim-vue'
" JSON formatting
Plug 'elzr/vim-json'
" Markdown live editing, need `npm install -g livedown`
Plug 'shime/vim-livedown'
Plug 'plasticboy/vim-markdown'
" Automatically rebuild ctags
Plug 'ludovicchabant/vim-gutentags'

" Automatic end complete
Plug 'tpope/vim-endwise'
" Autoclose HTML tags
Plug 'alvan/vim-closetag'
" Commment handling
Plug 'tpope/vim-commentary'
" Vim snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
" Easy quote and parenthesis
Plug 'tpope/vim-surround'
" Changes to single/multiple line if using gJ and gS
Plug 'AndrewRadev/splitjoin.vim'
" Switch true/false symbol/hashrocket etc with gs
Plug 'AndrewRadev/switch.vim'
" Allows to repeat with . also some Plugin commands such as vim.sorround ones
Plug 'tpope/vim-repeat'

" LSP support: needed for Ale
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
" Async lint engine
Plug 'w0rp/ale'

" Test
Plug 'vim-test/vim-test'

" Enables FocusLost and FocusGained events
Plug 'sjl/vitality.vim'
" Allow to quick jump between files, use :A to jump to the spec for example
Plug 'tpope/vim-projectionist'
" Jump between diff conflitcs
Plug 'tpope/vim-unimpaired'
" Useful vim mappings
Plug 'tpope/vim-unimpaired'
" Automatically position on a given line/col
Plug 'wsdjeg/vim-fetch'
" Simpler ruby folding
Plug 'vim-utils/vim-ruby-fold'
" Open GH at the given line
Plug 'ruanyl/vim-gh-line'

augroup END
" Initialize plugin system
call plug#end()

"""""""""""""""""""""""
" VIM OPTIONS BEGIN
"""""""""""""""""""""""

let mapleader = "-"                                       " Maps - as leader character

" Colorscheme
"let g:solarized_termcolors=256                           " Enable this if you don't have the solarize theme installed for your terminal e.g. Iterm
colorscheme solarized
set background=dark

set nocp                                                  " Set no compatibilty mode
set encoding=UTF-8                                        " Uses utf-8 encoding
set noswapfile                                            " Disable swap file
set nobackup                                              " Don't backup
set nowritebackup                                         " Write file in place
set autoread                                              " Automatically reload file changes
set autowriteall                                          " Automatically save buffers.
autocmd WinLeave * silent! wall                           " Automatically save changes before switching windows
autocmd FocusLost * silent! wall                          " Automatically save changes when loosing focus
syntax enable                                             " Enables syntax highlight
syntax sync minlines=500                                  " Only searches back 500 lines for indentation (better performance)
set regexpengine=1                                        " Force old regex engine > more performant for now
set scrolloff=3                                           " Always show 3 lines below the cursor
set rnu                                                   " Enables relative line numbers

" Hisory, cursor, rules
set history=100                                           " Remember last 100 commands
set laststatus=2                                          " Status bar always visible
set number                                                " to show the current line number
set showcmd                                               " Show current cursor info
set mouse=a                                               " Enable mouse movement Tabs and spaces
set cursorline                                            " Highlight current cursor line
let &t_SI = "\<Esc>]50;CursorShape=1\x7"                  " Thin cursor shape in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"                  " Fat cursor shape in normal mode
set cc=100                                                " Show column at 100

" Tabs and white spaces
set shiftwidth=2                                          " Use 2 space tabs by default
set softtabstop=2
set expandtab                                             " Expand tabs into spaces
set showbreak=↪\                                          " When text is wrapped
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨   " Highligth special characters and trailing whitespaces
set list                                                  " Activates highlight
set lbr                                                   " Enables line break
set splitright                                            " Always open vsplit to the right

" Indentation
set autoindent                                            " Automatically guess the indentation given the previous line indent
set smartindent
set textwidth=100                                         " Automatically breaks new line after 100 chars

" Folding
set nofen                                                   " Disable folding when opening a file
set foldmethod=manual                                     " Folds everything indented by 2 spaces
set foldlevel=0

" Search
set hlsearch                                              " Automatically highlights search results, to hide them run :noh
set incsearch                                             " Makes search act like search in modern browsers
set ignorecase                                            " Searches are case insensitive...
set smartcase                                             " ... unless they contain at least one capital letter
set showmatch                                             " Shows the matching ()

" Undos
set undofile                                              " Save undos after file closes
set undodir=$HOME/.vim/undo                               " where to save undo histories
set undolevels=1000                                       " How many undos

set wildmenu                                              " Command line auto completation with tab

set lazyredraw                                            " Do not redraw in the middle of a macro
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Identation spaces length depending on file format
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go specific settings
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go set nolist

" Python specific settings
autocmd BufNewFile,BufRead *.py setlocal shiftwidth=4

" C specific settings
au FileType c setl ts=8 sw=4 expandtab
au FileType ruby setl nowrap tabstop=8 tw=0 sw=2 expandtab

" Crontab specific settings
autocmd filetype crontab setlocal nobackup nowritebackup

" Sessions:
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle insert mode only caps lock with Ctrl+6
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Make program
autocmd User Rails setlocal makeprg=bundle\ exec\ rubocop\ -a\ \%
map <Leader>r :Make<CR>

" Open fold with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
hi Folded ctermfg=32

" Quick switch between numbers ruler
noremap <silent> <F12> :set number!<CR>

" Move to next/previous method start with { }
nmap } ]m
nmap { [m

" Buffer commands
" Map Alt + h
nnoremap ∆ :bprevious!<CR>
" Map Alt + l
nnoremap ¬ :bnext!<CR>
nmap <Leader>w :bp\|bd #<CR>                             " Closes buffer without closing the split view
nmap <Leader>q :%bd\|e# <CR>                             " Closes all buffer except current

" Copy file name with/without absolute pat?h to clipboard
nnoremap <Leader>c :let @*=expand("%")<CR>
nnoremap <Leader>C :let @*=expand("%:t")<CR>

" Remove trailing whitespaces on current line
nnoremap <Leader>x :let _s=@/ <Bar> :s/\s\+$//ge <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Remove trailing whitespaces on whole file
nnoremap <Leader>X :let _s=@/ <Bar> :%s/\s\+$//ge <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Changes window with CTRL+H,J,K,L
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Next/prev quickfix result with up and down arrows
map <down> :cn<CR>
map <up> :cp<CR>
" Next/prev locationlist with shift + up and down arrows
map <S-down> :lnext<CR>
map <S-up> :lprev<CR>

" Use <S-B> to clear the highlighting of :set hlsearch.
nnoremap <silent> <S-B> :nohlsearch<CR>

" easy way to edit reload .vimrc
nmap <Leader>V :source ~/.vimrc<cr>
nmap <Leader>v :vs ~/.vimrc<cr>

" <F2> Copy the current line in normal mode and the selected text in visual mode
" clipboard feature needs to be enabled
if has("clipboard")
  nmap <F2> "*yy
  vmap <F2> "*y
endif

" ProfileMe and ProfileStop to start and stop profiling
command! ProfileStart :profile start profile.log <bar> profile func * <bar> profile file *
command! ProfileStop :profile pause

" handles typo for :E as :e and :W as :w and :Vs :vS
cnoreabbrev E e
cnoreabbrev W w
cnoreabbrev Vs vs
cnoreabbrev vS vs

" Moves up and down between wrapped lines 1 step at time
nmap j gj
nmap k gk

" Paste always last yanked test
nmap P "0p

" Toggles on and off line wrap
function! ToggleWrap()
  if &wrap == 1
    set nowrap
    echo "line wrap off"
  else
    set wrap
    echo "line wrap on"
  endif
endfunction
nmap <F10> :call ToggleWrap()<CR>

" Toggles on and off relative line numbers
function! ToggleRelativeLineNumbers()
  if &rnu == 0
    set rnu
    echo "relative line numbers off"
  else
    set nornu
    echo "relative line numbers on"
  endif
endfunction
nmap <F6> :call ToggleRelativeLineNumbers()<CR>

" Toggle QuickfixList
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
nmap <F9> :call ToggleList("Quickfix List", 'c')<CR>

" Open LocationList
nmap <S-F9> :lopen<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN OPTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" AirLine
let g:airline_theme='solarized'                           " Airline color scheme
let g:airline#extensions#tabline#enabled = 1              " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'          " Show just the filename
let g:airline_powerline_fonts = 1                         " Allows the fancy powerline fonts
" truncate brach name to 16 chars
let g:airline_section_b  = '%.16{airline#util#wrap(airline#extensions#branch#get_head(),120)}'
" remove the file percentage
let g:airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#:%v'

" UtilSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" UltiSnips runs a check on every key press thus overloads the CPU when typing: https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt#L1698
" this fixes the issue
augroup ultisnips_no_auto_expansion
  au!
  au VimEnter * au! UltiSnips_AutoTrigger
augroup END

" Vim Markdown
let g:vim_markdown_folding_disabled = 1
" highlights code in Markdown fenced code blocks
let g:markdown_fenced_languages = ['ruby', 'python', 'sql', 'go', 'yaml']

" Enable code syntax in markdown (this is bultin in vim)
let g:markdown_fenced_languages = ['html', 'ruby']

" NERDTree triggered with F8
map <F8> :NERDTreeToggle<cr>
" NERDTree in current directory triggered with F7
map <F7> :NERDTreeFind<cr>
" Automatically close NERDTree when opening a new file
let NERDTreeQuitOnOpen = 1
" Automatically delte buffer on delete
let NERDTreeAutoDeleteBuffer = 1
" Goes up a directory with -
let NERDTreeMapUpdir='-'
" Prettier Look & Feel
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Vim test
nmap <silent> <Leader>s :TestNearest<CR>
nmap <silent> <Leader>e :TestFile<CR>
nmap <silent> <Leader>a :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>o :TestVisit<CR>
let test#strategy = "neovim"
" TODO use harpoon + configure it
" let test#strategy = "harpoon"

" The Silver Searcher
" Inspired by http://robots.thoughtbot.com/faster-grepping-in-vim/
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --path-to-ignore\ $HOME/.agignore

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind , (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! --hidden <args>|cwindow|redraw!

  nnoremap , :Ag<SPACE>
endif

" Fzf
let g:fzf_layout = { 'down': '~40%' }
nnoremap <C-p> :Files<cr>
" Enables history navigation
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Alt+p
nnoremap π :Buf<cr>

" Vim autoclose
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'

" Ale
let g:ale_linters = {
\   'ruby': ['ruby', 'rubocop'],
\   'eruby': ['erubis'],
\   'yaml': ['yamllint']
\}
" Disable slow ALE linters
let g:ale_linters_ignore = ['tslint', 'tidy', 'tsserver']
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '●'
let g:ale_virtualtext_cursor = 0
let g:ale_echo_msg_format = '[%linter%]: %s'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 1
" Shows ALE errors in vim airline
let g:airline#extensions#ale#enabled = 1
" Disable autocompletion
let g:ale_completion_enabled = 0

" Vim Vue
let g:vue_pre_processors = 'detect_on_enter'
let g:vue_pre_processors = ['haml']

" Allows html js and css in vue files
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd FileType vue syntax sync fromstart

" Rvm ctags
autocmd FileType ruby
      \ let &tags .= "," . $MY_RUBY_HOME . "/lib/tags" |
      \ let &path .= "," . $MY_RUBY_HOME . "/lib"

" Golang
" Remap alternate
autocmd FileType go
      \ :command! A GoAlternate

autocmd FileType go
      \ :command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')

autocmd Filetype go map <Leader>e <Plug>(go-test)

" Javascript
" disables JS syntax for html files: due to vue template files being very slow
autocmd FileType html syntax clear javascript

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
autocmd BufRead,BufNewFile Dangerfile set syntax=ruby

" Gutentags
let g:gutentags_ctags_exclude = ['target', 'tmp', 'spec', 'node_modules', 'public', '*.json', '*.svg']
" triggers a manual tags update on all the project
nmap <Leader>rt :GutentagsUpdate!<CR>

" gm for Markdown preview toggle
nmap gm :LivedownToggle

" git diff
" let g:gitgutter_diff_base = 'master'
" let g:gitgutter_highlight_lines = 1
" let g:gitgutter_highlight_linenrs = 1
" Run sync
let g:gitgutter_async = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" DOCS:
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" K to search with ag the word under cursor
" :Ag to search in files like with Ctrl+p
" :Rg to search in files using regex automatically showing results on change like with Ctrl+p
" Ctrp+p for fuzzy search files from name, repeat Ctrl+p and Ctrl+n to search inside the history
" Alt+p search inside open buffers
"
" Useful keywords to remember associated to Plugins:
" CTRL+] to jump to linked file such as CTRL+Click
" you can jump back with CTRL+SHIFT+[ or CTRL+T. With g + CTRL+] you see the list of all the tags associated
" SHIFT+B clears search (nohls)
" F8 for NERDTree
" F7 for NERDTree in current buffer folder
" F9 toggle quickfix
" F10 to toggle line wrap
" gcc to toggle comment on a line, gc to comment on visual mode, gcap to toggle comment on a paragraph
" gf to open the related file, 2gf to open the second related file, g] to show all the results
" gJ or gS to split/join if into 1 or multiple lines
" :A or :AV to open/open in vsplit the alternate file for example the spec
" CTRL+O CTRL+I to move between cursor jumps in history
" use * to go to next occurrence of the word under cursor
" rename html tag: cstt
" jump between git diff using ]n and [n and [n
" ciw caw to change inner and outer word
" zz / t / b to show in top middle center a method
" HML to move to top middle and bottom
" Case sensitive search with \C at start for example \CTest
" gT and gt to change tabs and CWt to move window into a new tab
" ]space [space add space before/after
" ]e [e move current line up or below
" \"*yy or prepend anything with \"* (unescaped) to use the system clipboard
" <Leader>r to run makeprg > rubucop for .ruby files
" <Leager>gb/gb open GH at git page or blame
"
" Tips:
" to do find and replace: ag -l pattern | xargs -o vim   # and then do your
" bufdo %s/pattern/replace/gc | update
" prepend with silent if you need to mass replace
" Or you can also do :Ag text and then run :cfdo %s/pattern/replace/gc
" :cfdo iterates over results in the quickfix window
" to create a markdown document: showdown makehtml -i tc_ui.md -o tc_ui.html or use third party app such ask Marked.app
"
" Setup_notes:
" - in order to use the truecolor version of solarized you need to setup " solarized scheme for your terminal: http://ethanschoonover.com/solarized
" - universal ctags are needed https://github.com/universal-ctags/ctags
" - you need to install fzf and the_silver_searcher
" - in order to have persistent undo run: mkdir ~/.vim/undo
" - you need to install on Mac the Dejavu nerd fonts: https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf and set them on Iterm
" - install livedown `npm install -g livedown`
"
"  For NeoVim:
"  pip2 install pynvim
"  pip3 install pynvim
"
"
" TODO:
" - autocomplete: COC and COQ vim, https://solargraph.org/guides as LSP:
"    configure correctly the preferred autocomplete
" - use harpoon, configure it and also use it as test strategy
" - refactor plugin settings by moving them to sub folders
" - fix folding to also hide comments
" - floating terminal for fzfz ? https://github.com/voldikss/vim-floaterm/blob/master/README.md 
"     https://gitlab.com/yorickpeterse/dotfiles/blob/master/.config/nvim/init.vim#L107-120
" - fix <p> indent for html and ERB
