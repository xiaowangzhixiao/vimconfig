" System Type {{{
let s:Gui = has('gui_running')
let s:Mac = has('mac') || has('macunix')
let s:Win = has('win32') || has('win64') || has('win32unix')
let s:Linux = has('linux')
"}}}
"INIT{{{
set nu
set sc
if version > 603
        set helplang=cn
    endif
    set fdm=marker
"Enable syntax hl
syntax on
"mapleader
let mapleader = ","
let g:mapleader = ","
" Sets how many lines of history VIM has to remember
set history=700
" Set to auto read when a file is changed from the outside
set autoread
set modelines=1
"}}}

" Init NeoBundle {{{
set nocompatible               " be iMproved
filetype off                   " required!

if s:Win
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
else
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!


"}}}
" Plugins {{{

 "My Plugins here:

 "original repos on github
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'tpope/vim-rails.git'
 "vim-scripts repos
"Plugin 'L9'
"Plugin 'FuzzyFinder'
 "non github repos
"Plugin 'git://git.wincent.com/command-t.git'

NeoBundle 'xitianfz/custom_vimconf'

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }

NeoBundle 'SearchComplete'
NeoBundle 'AutoTag'
NeoBundle 'AutoFenc'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sudo.vim'
NeoBundle 'matchit.zip'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle '2072/PHP-Indenting-for-VIm'
"NeoBundle 'applescript.vim'
"NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'tpope/vim-git'
"NeoBundle 'octol/vim-cpp-enhanced-highlight'
"NeoBundle 'SyntaxAttr.vim'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'tpope/vim-unimpaired.git'
NeoBundle 'rayburgemeestre/phpfolding.vim'
"NeoBundle 'fencview.vim'
NeoBundle 'xsbeats/vim-blade'
NeoBundle 'LargeFile'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'justinmk/vim-syntax-extra'
NeoBundle 'jiangmiao/auto-pairs'

"NeoBundle 'Shougo/unite.vim' "{{{
"call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      "\ 'ignore_pattern', join([
      "\ '\.git/',
      "\ ], '\|'))

"if executable('ag')
    "let g:unite_source_rec_async_command= 'ag --follow --nocolor --nogroup --hidden -g ""'
    "let g:unite_source_grep_command = 'ag'
    "let g:unite_source_grep_default_opts = '--column --nocolor --nogroup'
    "let g:unite_source_grep_recursive_opt = ''
"endif

"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>G :<C-u>Unite grep:.<cr>
""}}}
NeoBundle 'tobyS/vmustache'
NeoBundle 'tobyS/pdv' "{{{
if s:Win
    let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
else
    let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
endif
noremap <leader>cd :call pdv#DocumentCurrentLine()<CR>
"}}}
NeoBundle 'kien/ctrlp.vim' "{{{
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 1
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g "" --ignore ".svn" --ignore ".git" --ignore "*.pyc" --ignore "*.pyo" --ignore "node_modules"'
else
    let g:ctrlp_user_command = "find -L %s -type f \! \\( -path '*/.svn/*' -or -path '*/.git/*' -or -name '*.rrd' -or -name '*.pyc' -or -name '*.pyo' -or -name 'node_module' \\)"
endif
"}}}
NeoBundle 'scrooloose/nerdtree' "{{{
let g:NERDChristmasTree = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDShowBookMarks = 1
let g:NERDTreeIgnore = ['\.pyc$']
noremap <F2> :NERDTreeToggle<cr>
"}}}
NeoBundle 'scrooloose/syntastic' "{{{
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_aggregate_errors = 1
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['python'] }
let g:syntastic_php_checkers = ['php']
"}}}
NeoBundle 'mattn/emmet-vim' "{{{
NeoBundle 'mattn/webapi-vim'
let g:user_zen_settings = { 'lang': "zh-CN" }
"}}}
NeoBundle 'taglist.vim' "{{{
noremap <F3> :TlistToggle<cr>
"}}}
NeoBundle 'tpope/vim-fugitive' "{{{
noremap <leader>g :Gstatus<cr><c-w>_
"}}}
NeoBundle 'StanAngeloff/php.vim' "{{{
let g:php_folding = 0
let g:php_strict_blocks = 1
let g:php_sql_query = 1
let g:php_htmlInStrings = 1
let g:php_baseLib = 1
let g:php_special_vars = 1
let g:php_special_functions = 1
let g:php_alt_assignByReference = 1
let g:php_smart_members = 1

let g:php_nested_functions = 1
"}}}
NeoBundle 'Lokaltog/vim-easymotion' "{{{
let g:EasyMotion_leader_key = ';'
"}}}
NeoBundle 'tomasr/molokai' "{{{
set t_Co=256
let g:molokai_original = 1
"}}}
NeoBundle 'kchmck/vim-coffee-script' "{{{
autocmd BufRead,BufNewFile *.coffee set filetype=coffee
autocmd BufWritePost *.coffee silent make!
"}}}
NeoBundle 'brookhong/cscope.vim' "{{{
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
"}}}

if has('lua')
    NeoBundle 'Shougo/neocomplete' "{{{
    set completeopt-=preview
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 2
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'


    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    "let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplete#enable_auto_close_preview = 0
    "}}}
else
    NeoBundle 'Shougo/neocomplcache' "{{{
    set completeopt-=preview
    let g:neocomplcache_enable_auto_close_preview = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_caching_limit_file_size = 50000000
    let g:neocomplcache_min_syntax_length = 2
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::|\$\h\w*'
    "<CR>: close popup and save indent.
    inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    "<TAB>: completion. NO USE with snipmate
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    "<C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-Y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    let g:neocomplcache_enable_auto_select = 0
    "}}}
endif

NeoBundle 'nathanaelkane/vim-indent-guides' "{{{
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi Visual term=reverse ctermbg=238 guibg=#403D3D
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=black ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235 guibg=#262626
"}}}
"}}}
"End NeoBundle{{{

" Required:
filetype plugin indent on

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"}}}
"Post Loading Plugin Config{{{

" emmet
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/misc/emmet_custom.json')), "\n"))

"}}}

" Custom Maps {{{
noremap <leader>q <C-W>c
noremap <leader>w :w!<cr>
noremap <F4> <C-W>_
inoremap <F4> <C-W>_
noremap <F5> :make!<cr>
noremap <leader>s :sh<cr>
noremap \| :ls<cr>
" Fast editing of the .vimrc
if s:Win
	map <leader>e :e! $HOME/.vim/vimrc<cr>
else
	map <leader>e :e! $HOME/.vimrc<cr>
endif
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>vg :vimgrep //j **/*.*<left><left><left><left><left><left><left><left><left>
map <leader>pp :setlocal paste!<cr>
map <leader>bb :cd ..<cr>
"}}}
" User Interface {{{
if s:Win
    set encoding=cp936
else
    set encoding=utf8
endif

" Set 7 lines to the curors - when moving vertical..
set so=7
set wildmenu "Turn on WiLd menu
set ruler "Always show current position
set hid "Change buffer - without saving
" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" set ignorecase "Ignore case when searching
set smartcase
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros
set magic "Set magic on, for regular expressions
set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink
" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"}}}
" Colors and Fonts {{{
" Set font according to system
if s:Mac
	set gfn=Menlo:h14
	set shell=/bin/bash
    if s:Gui
        set guioptions-=T
        set guioptions-=L
        set guioptions-=r
    endif
elseif s:Win
	set gfn=Yahei_Consolas_Hybrid:h12:cGB2312
    let &termencoding=&encoding
    set fileencodings=utf-8,gbk,ucs-bom,cp936
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    if s:Gui
        set guioptions-=T
        set guioptions-=r
        set guioptions-=b
        set guioptions-=l
        set guioptions-=L
        au GUIEnter * simalt ~x
    endif
elseif s:Linux
	set gfn=Monospace\ 10
	set shell=/bin/bash
endif
set ffs=unix,dos,mac "Default file types
colo molokai
"}}}
" Files, backups and undo {{{
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
"}}}
" Text, tab and indent related {{{
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines
"}}}
" Visual mode related {{{
function! CmdLine(str)
	exe "menu Foo.Bar :" . a:str
	emenu Foo.Bar
	unmenu Foo
endfunction
"}}}
" Command mode related {{{
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>
" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>
" Bash like keys for the command line
cnoremap <C-A>          <Home>
cnoremap <C-E>          <End>
cnoremap <C-K>          <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
func! Cwd()
	let cwd = getcwd()
	return "e " . cwd
endfunc
func! DeleteTillSlash()
	let g:cmd = getcmdline()
	if s:Win
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
	else
		let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
	endif
	if g:cmd == g:cmd_edited
		if s:Win
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
		else
			let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
		endif
	endif  
	return g:cmd_edited
endfunc
func! CurrentFileDir(cmd)
	return a:cmd . " " . expand("%:p:h") . "/"
endfunc
"}}}
" Moving around, tabs and buffers {{{
" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-g> <C-W>_
" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :1,300 bd!<cr>
" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit\ 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove\ 
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr("%") == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		execute("bdelete! ".l:currentBufNum)
	endif
endfunction
" Specify the behavior when switching between buffers
try
	set switchbuf=usetab
	"set stal=2
catch
endtry
"}}}
" Statusline {{{
" Always hide the statusline
set laststatus=2
" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ Line:\ %l/%L:%c
function! CurDir()
	let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
	return curdir
endfunction
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	else
		return ''
	endif
endfunction
"}}}
" Editing mappings {{{
"Remap VIM 0
map 0 ^
"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if s:Mac
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif
"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
set guitablabel=%t
"}}}
" Cope {{{
" Do :help cope if you are unsure what cope is. It's super useful!
 map <leader>vc :botright cope<cr>
 map <leader>vn :cn<cr>
 map <leader>vp :cp<cr>
 map <leader>vq :ccl<cr>
"}}}

" Filetype Specified {{{
""""""""""""""""""""""""""""""
" => PHP section
""""""""""""""""""""""""""""""
autocmd FileType php inoremap <buffer> {<cr> {<cr>}<esc>O
autocmd FileType php noremap <buffer> <leader>ep i<?php  ?><esc>hhi
autocmd FileType php noremap <buffer> <leader>eP i<?php<cr>?><esc>O<esc>==i
autocmd FileType php noremap <buffer> <leader>ee i<?php echo ; ?><esc>hhhi
autocmd FileType php setlocal cindent 
autocmd FileType php setlocal makeprg=php\ %
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd BufRead,BufNewFile *.ctp set filetype=php.html

""""""""""""""""""""""""""""""
" => Smarty & Blade section
""""""""""""""""""""""""""""""
autocmd FileType smarty setlocal shiftwidth=2
autocmd FileType smarty setlocal tabstop=2

autocmd BufRead,BufNewFile *.blade.php set filetype=blade
autocmd FileType blade setlocal shiftwidth=2
autocmd FileType blade setlocal tabstop=2

""""""""""""""""""""""""""""""
" => CSS section
""""""""""""""""""""""""""""""
autocmd FileType css inoremap <buffer> {<cr> {<esc>o}<esc>O
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""

au FileType python setlocal makeprg=ipython\ %

let python_highlight_all = 1

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
au FileType python match OverLength /\%80v.\+/

""""""""""""""""""""""""""""""
" => C section
"""""""""""""""""""""""""""""""
autocmd FileType C inoremap <buffer> {<cr> {<esc>o}<esc>O
autocmd FileType C setlocal makeprg=gcc\ -o\ a\ % \&\& ./a

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript inoremap <buffer> {<cr> {<esc>o}<esc>O
" au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

function! JavaScriptFold()
	setl foldmethod=syntax
	setl foldlevelstart=1
	syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

	function! FoldText()
		return substitute(getline(v:foldstart), '{.*', '{...}', '')
	endfunction
	setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""
" => ActionScript section
"""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.as set filetype=actionscript

" Load Custom{{{
if filereadable(expand('~/.vim/custom.vim'))
    so ~/.vim/custom.vim
endif
if filereadable(expand('.custom.vim'))
    so .custom.vim
endif
"}}}
" vim:fdm=marker
