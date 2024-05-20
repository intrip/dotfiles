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

" Solarized color scheme
Plug 'maxmx03/solarized.nvim'
" Required for Solarized color scheme
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Cool dev icons
Plug 'ryanoasis/vim-devicons'

" Ruby
Plug 'vim-ruby/vim-ruby'
" Helps for CTags tpope/vim-bundler
Plug 'tpope/vim-bundler'
" Rails
Plug 'tpope/vim-rails'
" Javascript
Plug 'pangloss/vim-javascript'
" Coffeescript
Plug 'kchmck/vim-coffee-script'
" Typescript
Plug 'leafgarland/typescript-vim'
" Haml and Scss
Plug 'tpope/vim-haml'
" Golang extension
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" C ruby
Plug 'mrkn/vim-cruby'
" JSON formatting
Plug 'elzr/vim-json'
" Markdown live editing, need `npm install -g livedown`
Plug 'shime/vim-livedown'
Plug 'plasticboy/vim-markdown'
" CSV queries/editing
Plug 'mechatroner/rainbow_csv'

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
Plug 'intrip/vim-ruby-fold'
" Open GH at the given line
Plug 'ruanyl/vim-gh-line'
" GH Copilot
Plug 'github/copilot.vim'

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
autocmd FocusLost * silent! wall                          " Automatically save changes when losing focus
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
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨ " Highligth special characters and trailing whitespaces
set list                                                  " Activates highlight
set lbr                                                   " Enables line break
set splitright                                            " Always open vsplit to the right

" Indentation
set textwidth=100                                         " Automatically breaks new line after 100 chars
set autoindent                                            " Automatically guess the indentation given the previous line indent
set smartindent

" Folding
set fen                                                   " Enable folding when opening a file
" set nofen                                                 " Disable folding when opening a file
set foldlevel=1
" Check https://github.com/vim-ruby/vim-ruby/pull/272
" For now I prefer to use my plugin fork because allows to have by default comment
" as folded and by adding 1 more level you fold also the methods.
let ruby_fold = 1
let ruby_foldable_groups = 'def #'

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

" Make program: rubocop
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

" Copy file name with/without absolute path to clipboard
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

" Quick way to edit reload .vimrc
nmap <Leader>V :source $MYVIMRC<cr>
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
cnoreabbrev Q q
cnoreabbrev Qa qa

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
nmap <F11> :call ToggleWrap()<CR>

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
nmap <F10> :lopen<CR>

" Clear marks used for common files
command! Clearm delm A S D F G H
map <Leader>M :Clearm<CR>
function! KeepMarks()
  %bd
  silent! 'A
  silent! 'S
  silent! 'D
  silent! 'F
  silent! 'G
  silent! 'H
endfunction
map <Leader>Q :call KeepMarks()<CR>

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

" GH Copilot
let g:copilot_node_command = "/Users/jacopobeschi/.nodenv/versions/16.15.0/bin/node"

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
" Automatically delete buffer on delete
let NERDTreeAutoDeleteBuffer = 1
" Go up a directory with -
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
" TODO maybe use harpoon test terminal + configure it
" let test#strategy = "harpoon"

" if $DOCKE_APPNAME is set uses it with docker_compose
if exists("$DOCKER_APPNAME")
  let test#ruby#rspec#executable = 'docker-compose exec -e RAILS_ENV=test ${DOCKER_APPNAME} bundle exec rspec'
  let test#ruby#minitest#executable = 'docker-compose exec -e RAILS_ENV=test ${DOCKER_APPNAME} bundle exec ruby -Itest'
endif

  let test#ruby#minitest#executable = 'bin/rails test'
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
nnoremap <C-p> :Files<CR>
" Enables history navigation
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Alt+p
nnoremap π :Buf<cr>
" Ctrl+'
nnoremap <C-'> :BTags<CR>

" Ctags
map <silent> <Leader>rt :!~/.bin/retag<cr>

" Vim autoclose
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'

" Ale
let g:ale_linters = {
\   'ruby': ['ruby', 'rubocop', 'solargraph'],
\   'eruby': ['erubis'],
\   'yaml': ['yamllint']
\}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 1
" Look & Feel
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '●'
let g:ale_virtualtext_cursor = 0
let g:ale_echo_msg_format = '[%linter%]: %s'
" Shows ALE errors in vim airline
let g:airline#extensions#ale#enabled = 1
" Uses Ale to autocomplete with Ctrl+P
set omnifunc=ale#completion#OmniFunc
" CTRL+p for autocomplete with solargraph
inoremap <C-p> <C-x><C-o>
" Show docs, requires solargraph download-core to be ran
map <Leader>h :ALEHover<CR>

" Vim Vue
let g:vue_pre_processors = 'detect_on_enter'
let g:vue_pre_processors = ['haml']

" Allows html js and css in vue files
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd FileType vue syntax sync fromstart

" Golang
" Remap alternate
autocmd FileType go
      \ :command! A GoAlternate

autocmd FileType go
      \ :command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')

" Javascript
" disables JS syntax for html files: due to vue template files being very slow
autocmd FileType html syntax clear javascript

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
autocmd BufRead,BufNewFile Dangerfile set syntax=ruby
" Set auto complete
autocmd FileType html,erb set omnifunc=htmlcomplete#CompleteTags


" gm for Markdown preview toggle
nmap gm :LivedownToggle<CR>

" git diff
" let g:gitgutter_diff_base = 'master'
" let g:gitgutter_highlight_lines = 1
" let g:gitgutter_highlight_linenrs = 1
" Run sync
let g:gitgutter_async = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" DOCS:
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" gJ or gS to split/join if into 1 or multiple lines
" rename html tag: cstt
" jump between git diff using ]n and [n and [n
" ciw caw to change inner and outer word
" zz / t / b to show in top middle center a method
" HML to move to top middle and bottom
" ]space [space add space before/after
" ]e [e move current line up or below
" <Leader>r to run makeprg > rubucop for .ruby files
" <Leader>gb/gb open GH at git page or blame
"
" Tips:
" to do find and replace:
" - ag pattern
" - cfdo %s/pattern/replace/gc
"   prepend with silent if you need to mass replace
"
" Setup_notes:
" - in order to use the truecolor version of solarized you need to setup " solarized scheme for your terminal: http://ethanschoonover.com/solarized
" - universal ctags are needed https://github.com/universal-ctags/ctags
" - you need to install fzf and the_silver_searcher
" - you need to install on Mac the Dejavu nerd fonts: https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf and set them on Iterm
" - install livedown `npm install -g livedown`
" - Solargraph for LSP, https://solargraph.org/guides/getting-started
"   - run 'solargraph download-core' on new ruby installation
"
"  For NeoVim:
"  pip2 install pynvim
"  pip3 install pynvim
"  In general run checkhealth provider and fix issues
"
" TODO:
"  LATER:
"   - refactor plugin settings by moving them to sub folders such as ftplugin
"   - Configure ALE for refactoring
"   - Configure ALE for symbol search
"   - Solagraph rails
"   - Configure ALE go to definition with solargraph: need better checks because it cannot navigate inside libs; on the other hand ctags navigation sometimes has too many results
"   - Tree-setter?
"   - try telescope instead of FZF? FZF so far is ok
