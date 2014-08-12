" Sources {{{
" vi-improved.org/vimrc.php
" github.com/carlhuda/janus
" github.com/gmarik/vimfiles/blob/master/vimrc
" github.com/durdn/cfg/blob/master/.vimrc
" github.com/factorylabs/vimfiles
" github.com/lukerandall/dotvim/blob/master/vimrc
" github.com/mathiasbynens/dotfiles/blob/master/.vimrc
" viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html
"}}}
" Plugins {{{
" Init Vundle {{{
filetype off
set nocompatible
set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"}}}
" Sane defaults {{{
Plugin 'tpope/vim-sensible'
"}}}
" Colors {{{
Plugin 'vim-colors-solarized', { 'pinned': 1 }
"}}}
" Languages {{{
" HTML {{{
Plugin 'matchit.zip'
Plugin 'othree/html5.vim'
"}}}
" Templates {{{
Plugin 'lepture/vim-jinja'
Plugin 'tpope/vim-liquid'
"}}}
" CSS {{{
Plugin 'wavded/vim-stylus'
"}}}
" Javascript {{{
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'marijnh/tern_for_vim'
"}}}
" Bbye
Plugin 'moll/vim-bbye'
command! -bang -complete=buffer -nargs=? BD Bdelete<bang> <args>
"}}}
" Plugin viewdoc
Plugin 'powerman/vim-plugin-viewdoc'
"}}}
" Markdown {{{
Plugin 'tpope/vim-markdown'
"}}}
" Buffergator
" Plugin 'jeetsukumaran/vim-buffergator'
" let g:buffergator_viewport_split_policy="B"
" }}}
" Everything else {{{
" Plugin 'camelcasemotion'
Plugin 'kien/ctrlp.vim'
Plugin 'IndexedSearch'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-misc'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'Raimondi/delimitMate'
Plugin 'mileszs/ack.vim'
Plugin 'zerowidth/vim-copy-as-rtf'
Plugin 'tpope/vim-eunuch'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'edkolev/tmuxline.vim'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-endwise'
Plugin 'powerman/vim-plugin-AnsiEsc'


"}}}

" HTML Plugins
Plugin 'ynonp/HTML-AutoCloseTag'
Plugin 'hail2u/vim-css3-syntax'
"}}}
" Finish Init Vundle {{{
call vundle#end()
filetype plugin indent on
"}}}
"}}}
" Options {{{
" Colors {{{
colo industry
"}}}
" Spaces {{{
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
"}}}
" Status Line {{{
set shortmess=atI
set noshowmode
"}}}
" Ignored {{{
set wildignore+=*.swp,.git/,*.jpg,*.jpeg,*.png,*.gif,*.psd,*.pdf,\.DS_Store
set wildignore+=*.pyc,*.pyo,*.egg,*.egg-info
set wildignore+=*.a,*.o,*.so
set wildignore+=*.class
"}}}
" Keys {{{
let mapleader=","
cabbrev vhelp vert help

nnoremap j gj
nnoremap k gk

nnoremap <silent> <C-j> <C-W>j
nnoremap <silent> <C-k> <C-W>k
nnoremap <silent> <C-h> <C-W>h
nnoremap <silent> <C-l> <C-W>l

" inoremap 1 !
" inoremap 2 @
" inoremap 3 #
" inoremap 4 $
" inoremap 5 %
" inoremap 6 ^
" inoremap 7 &
" inoremap 8 *
" inoremap 9 (
" inoremap 0 )
" inoremap - _

" inoremap ! 1
" inoremap @ 2
" inoremap # 3
" inoremap $ 4
" inoremap % 5
" inoremap ^ 6
" inoremap & 7
" inoremap * 8
" inoremap ( 9
" inoremap ) 0
" inoremap _ -
"}}}
" Searching {{{
set smartcase
set ignorecase
set wildmode=list:longest
if exists('&wildignorecase') | set wildignorecase | endif
"}}}
" Format {{{
set nowrap
set linebreak
set textwidth=79
set matchtime=3
set nolist
set nosmartindent
set cindent

augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END

function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call StripTrailingWhitespaces()
"}}}
" Backup {{{
set nobackup
set nowritebackup
"}}}
" Bells {{{
set novisualbell
"}}}
" Misc. {{{
set nostartofline
set splitbelow splitright
set hidden
set title
let g:is_bash=1
"}}}
"}}}
" Plugin configurations {{{
" Airline {{{
let g:airline_left_sep=''
let g:airline_right_sep=''
"}}}
" CtrlP {{{
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_lazy_update = 0
noremap <silent> <leader>b :CtrlPBuffer<CR>
noremap <silent> <leader>t :CtrlPTag<CR>
let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("j")': ['<c-n>'],
            \ 'PrtSelectMove("k")': ['<c-p>'],
            \ 'PrtHistory(-1)':  ['<c-j>'],
            \ 'PrtHistory(1)': ['<c-k>'],
            \ }
"}}}
" NERDTree {{{
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 1
let NERDTreeShowFiles = 1
let NERDTreeMinimalUI = 1
let NERDTreeWinPos = 'left'
let NERDTreeIgnore = [
            \ '.DS_Store', '\.swp$', '\~$',
            \ '\.jpg$', '\.jpeg$', '\.png$', '\.gif$', '\.pdf$',
            \ '\.class$',
            \ '\.a$', '\.o$', '\.so$',
            \ '\.pyc$', '\.pyo$'
            \ ]

noremap <silent> <Leader>n :NERDTreeToggle<CR>
"}}}
" Repeat {{{
silent! call repeat#set("\<Plug>.", v:count)
"}}}
" Sneak {{{
highlight link SneakPluginTarget Visual

nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
xmap <leader>s <Plug>Sneak_s
xmap <leader>S <Plug>Sneak_S
omap <leader>s <Plug>Sneak_s
omap <leader>S <Plug>Sneak_S

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
"}}}
" Syntastic {{{
" noremap <silent> <Leader>c :echo "Checking..."<CR> :SyntasticCheck<CR>
" let g:syntastic_mode_map = { "mode": "passive" }

let g:syntastic_id_checkers = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2

let g:syntastic_enable_signs = 1
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '♫'
let g:syntastic_style_error_symbol = '♪'
highlight link SyntasticStyleErrorSign Todo

let g:syntastic_html_checkers = ['tidy', 'jshint']
let g:syntastic_python_checkers = ['flake8', 'pep257']

let g:syntastic_c_compiler_options = '-ansi -Wall -Wextra'
let g:syntastic_cpp_compiler_options = '-Wall -Wextra -Weffc++'
let g:syntastic_c_include_dirs = [ 'includes', 'include', 'inc',  'headers' ]
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_check_header = g:syntastic_c_check_header
let g:syntastic_cpp_include_dirs = g:syntastic_c_include_dirs
let g:syntastic_cpp_auto_refresh_includes = g:syntastic_c_auto_refresh_includes
let g:syntastic_cpp_remove_include_errors = g:syntastic_c_remove_include_errors
"}}}
" Tagbar {{{
nnoremap <silent> <Leader>g :TagbarToggle<CR>

let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

let g:tagbar_type_javascript = { 'ctagsbin' : 'jsctags' }
"}}}
" Tern {{{
let g:tern#command = ['tern', '--no-port-file']
let g:tern_show_signature_in_pum = 1
" let g:tern_show_argument_hints = 'on_move'
"}}}
" Virtualenv {{{
" let g:virtualenv_directory = 'venv'
"}}}
" Vundle {{{
cabbrev BundleInstall PluginInstall
cabbrev BundleInstall! PluginInstall!
cabbrev BundleClean PluginClean
cabbrev BundleClean! PluginClean!
cabbrev BundleList PluginList
cabbrev BundleList! PluginList!
cabbrev BundleSearch PluginSearch
cabbrev BundleSearch! PluginSearch!
"}}}
" Autocmds {{{
" BufWinEnter {{{
augroup Buf-Win-Enter
    autocmd!
    autocmd BufWinEnter *.less setfiletype less
    autocmd BufWinEnter .jshintrc setfiletype javascript
    autocmd BufWinEnter .tern-config,.tern-project setfiletype json
    autocmd BufWinEnter *.md,*.markdown setfiletype markdown
    " autocmd BufWinEnter * if &textwidth > 8 | if exists("w:highlight_text_width") | call matchdelete(w:highlight_text_width) | endif | let w:highlight_text_width=matchadd('ColorColumn', printf('\%%%dv', &textwidth+1), -1) | endif
augroup END
"}}}
" FileType {{{
augroup File-Type
    autocmd!
    autocmd FileType qf setlocal wrap
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType html,xml,jinja,liquid,css,scss,less,stylus,ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType html,xml,jinja,liquid runtime! macros/matchit.vim
    autocmd FileType jinja setlocal commentstring={#\ %s\ #}
    autocmd FileType scss,less,stylus setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType tex setlocal number norelativenumber
augroup END
"}}}
"}}}

" UltiSnip {{{
" Track the engine.
    filetype off
    Plugin 'SirVer/ultisnips'

    " Snippets are separated from the engine. Add this if you want them:
    Plugin 'honza/vim-snippets'

    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    " let g:UltiSnipsExpandTrigger="<tab>"
    " let g:UltiSnipsJumpForwardTrigger="<c-b>"
    " let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
" }}}

" Vim Template {{{
  Plugin 'ynonp/vim-template'
" }}}

" Vim Tmuxify {{{
    Plugin 'mhinz/vim-tmuxify'
    nnoremap <leader>mx :TxKill<cr>
    au BufLeave,VimLeave * if exists('b:pane_id') | TxKill | endif
    let g:tmuxify_custom_command = 'tmux split-window -d -h -p 30 "PS1=$\\  bash"'
    let g:tmuxify_run = {
        \ 'sh': 'echo; bash %; echo',
        \ 'perl' : 'echo; perl %; echo',
        \}
" }}}

" Vim rails {{{
    Plugin 'tpope/vim-rails'
    let g:rubycomplete_buffer_loading = 1
    let g:rubycomplete_classes_in_global = 1
    let g:rubycomplete_rails = 1
    let g:rubycomplete_use_bundler = 1


" }}}


" local vimrc options
set number
syntax enable
filetype plugin indent on

" insert mode movement key mapping
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

noremap OA <up>
noremap OB <down>
noremap OC <right>
noremap OD <left>

nnoremap <leader>u :GundoToggle<cr>

nnoremap <leader>C ct;
nnoremap <leader>D dt;

let g:ctrlp_root_markers = [".vimprj"]
set rtp+=.vimprj

" abbrevations
cabbr <expr> %% expand('%:p:h')

" *******************
" * Other Settings
"
" autocomplete
set completeopt=longest,menuone

" Visual Block selection
set virtualedit=block

set hlsearch

let g:airline_theme="ubaryd"

set ttyfast
set ttymouse=xterm2
set mouse=a
