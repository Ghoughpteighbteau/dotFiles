" vim: foldmethod=marker

"{{{1 Initial config
set shell=/bin/sh "Vim must operate in a POSIX compliant shell, if you're not in one, hooo boy
set nocompatible  "Might as well actually use Vim instead of Vi

"{{{1 Vundle Settings
filetype off      "Vundle needs this off, we turn it on later

call plug#begin('~/.vim/plugged')

"set rtp+=~/.vim/plugged/vim-plug/
"call vundle#rc()

"So vundle will update itself
"Plug 'gmarik/Vundle.vim'
Plug 'junegunn/vim-plug'

"{{{2 Scroll Colors - For selecting themes
" use the COLORSCROLL command to activate it test colorthemes
Plug 'ScrollColors'

"{{{3 xoria256 colorscheme - Super awesome
Plug 'vim-scripts/xoria256.vim'

"{{{3 mustang-vim colorscheme - Also Super awesome
Plug 'croaker/mustang-vim'

"{{{2 Indent Guides - Provides alternating bars for indentation
" This plugin provides 3 commands, all prefixed with IndentGuides
Plug 'Indent-Guides'
	let g:indent_guides_enable_on_vim_startup = 1
	let g:indent_guides_color_change_percent = 5

"{{{2 editorConfig - Reads .editorconfig files and obeys
Plug 'editorconfig/editorconfig-vim'

"{{{2 Tabularize - Run :Tab /pattern to format tabular data
Plug 'godlygeek/tabular'

"{{{2 NERD Commenter - An insanely over the top commenting plugin.
Plug 'scrooloose/nerdcommenter'

"{{{2 Airline - the sexy little bar at the bottom
Plug 'bling/vim-airline'
	"Set this to one if you have a Powerline patched font (google it)
	let g:airline_powerline_fonts = 1
	set laststatus=2
	set noshowmode

"{{{2 Fugitive - For sexy git integration
Plug 'fugitive.vim'

"{{{2 git-gutter - Shows changes in active repository
Plug 'airblade/vim-gitgutter'
	let g:gitgutter_diff_args = '-w' "ignore whitespace
	let g:gitgutter_sign_added = '++'
	let g:gitgutter_sign_modified = '~~'
	let g:gitgutter_sign_removed = 'xx'
	let g:gitgutter_sign_removed_first_line = '->'
	let g:gitgutter_sign_modified_removed = '~x'
	highlight link GitGutterAdd          DiffAdd
	highlight link GitGutterChange       DiffChange
	highlight link GitGutterDelete       DiffDelete
	highlight link GitGutterChangeDelete DiffChange

"{{{2 Sensible - This seems sensible, (a smattering of sensible defaults)
Plug 'tpope/vim-sensible'

"{{{2 Unimpared - A list of symetric hotkeys
" Primarily used to bubble lines, but lots of cool features
" check out :h unimpaired
Plug 'tpope/vim-unimpaired'

	"{{{3 Bubbling commands - Ctrl + up or down to bubble selections
	nmap <C-up> [e
	nmap <C-down> ]e
	vmap <C-up> [egv
	vmap <C-down> ]egv

"{{{2 match it - Makes it so % jumps XML tags correctly (and more)
Plug 'matchit.zip'

"{{{2 ZenCoding - for fast HTML completions
Plug 'mattn/emmet-vim'

"{{{2 css-color - Changes background of hex squares to represent color
Plug 'skammer/vim-css-color'

"{{{2 YouCompleteMe - Advanced code completion for C languages
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
	"let g:ycm_autoclose_previw_window_after_insertion = 1
	"Special instructions: When YCM updates, it often needs a recompile
	"By default, that is done by running ~/.vim/bundle/YouCompleteMe/install.sh

"{{{2 vim-go - An entire development environment package for golang in vim
Plug 'fatih/vim-go'
	au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

"{{{2 vim2hs - An entire development environment package for haskell in vim
Plug 'dag/vim2hs'
Plug 'eagletmt/ghcmod-vim'
	Plug 'Shougo/vimproc.vim', { 'do': 'make' }

au FileType haskell setl sw=2 sts=2 et

"{{{2 neco-ghc - Code completion using ghcmod
Plug 'eagletmt/neco-ghc'
	let g:ycm_semantic_triggers = {'haskell' : ['.']}
	let g:necoghc_enable_detailed_browse = 1
	au FileType haskell setl omnifunc=necoghc#omnifunc

"{{{2 python-mode - a developmen suite for python files
"Plug 'klen/python-mode'

"{{{2 tagbar - Displays all of the tags generated by ctags/gotags. press F8
Plug 'majutsushi/tagbar'
	nmap <F8> :TagbarToggle<CR>

"{{{2 Easymotion - Allows you to add \ before a move command to do a fastmove!
Plug 'Lokaltog/vim-easymotion'
	"Single leader prefix
	map <Leader> <Plug>(easymotion-prefix)
	"easymotion search
	map  / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)
	map  n <Plug>(easymotion-next)
	map  N <Plug>(easymotion-prev)
	"bothdirection search
	map  s <Plug>(easymotion-s)

    let g:EasyMotion_smartcase = 1

"{{{2 CtrlP - Like Command T, a file explorer, use CTRL-T
Plug 'kien/ctrlp.vim'
	let g:ctrlp_map = '<c-t>'
	let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"{{{2 Syntastic - does code auditing based on file type and linters on system
Plug 'scrooloose/syntastic'
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0

"{{{2 Syntax bundles - All the bundles that provide syntax stuff
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'Soares/fish.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ipoddubny/asterisk-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'nelstrom/vim-markdown-folding'
Plug 'octave.vim'
Plug 'sirtaj/vim-openscad'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-markdown'
Plug 'wting/rust.vim'
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-misc'
Plug 'yosssi/vim-gcss'

call plug#end()

"{{{1 My Settings
set number		"Numberlines
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
set history=700
set tabstop=4
set shiftwidth=4
set scrolloff=7
set foldmethod=syntax
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

"{{{2 When searching, center the screen on the found item
"map N Nzz
"map n nzz

" this key is awful.
nnoremap Q <nop>

" pageup sucks compares to <C-u> and <C-d>
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

"{{{2 Sudo escalation commands - :W will sudo write. :Wq doesn't work :(
command! W w !sudo tee % >/dev/null

"{{{1 Some gui/nongui independent settings
"colorscheme xoria256
if has("gui_running")
	"colorscheme xoria256
	colorscheme mustang
	set go+=c
	set go-=e
	set go-=m
	set go-=T
else
	set t_Co=256
	colorscheme desert
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

"These colors are must set.
highlight DiffAdd ctermfg=234 ctermbg=151 guifg=bg guibg=#afdfaf
highlight DiffChange ctermfg=234 ctermbg=223 guifg=bg guibg=LightYellow
highlight DiffDelete ctermfg=234 ctermbg=174 guifg=bg guibg=#df8787 gui=NONE
highlight DiffText ctermfg=234 ctermbg=246 guifg=bg guibg=#949494 gui=NONE
highlight SignColumn term=standout ctermfg=248 ctermbg=8 guifg=#a8a8a8 guibg=#444444

filetype plugin indent on
