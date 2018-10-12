set nocompatible

" check os and set os variable {{{
let os = ""
if has("win32") || has("win16")
  let os = "win"
elseif has("unix")
  let os = "unix"
endif
" }}}

" source additional files {{{
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" "one click compile setup
" source $Vim\IDE.vim
" }}}

" cscope
if os == "unix"
    source ~/.vim/bundle/cscope/cscope_maps.vim
    se cscopeprg=cscope\ -C
    se csre
endif

" My Setup of options {{{
se hlsearch
se nobackup
se nowritebackup 
"se relativenumber "rnu
"se number "nu
"se ruler "ru
se autoindent  "ai
se shiftwidth=4
se laststatus=2
colorscheme torte
hi User1 guifg=black guibg=DarkGray ctermfg=15 ctermbg=9 gui=bold term=bold
se statusline=%1*\%m[%<%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[%v,%p%%,%L]
se tabstop=4
se expandtab
se ignorecase smartcase
if os == "win"
  set guifont=Consolas:h12
endif
if os == "win"
  set undodir=C:\\WINDOWS\\TEMP\\
elseif os == "unix"
  set undodir=/tmp/,.
endif
se undofile
se guioptions-=T "go, remove toolbar
" se cscopequickfix=s-,c-,d-,i-,t-,e-
" se foldmethod=syntax
" }}}

" solve encoding problem {{{
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,big5,cp936,gb18030,euc-jp,euc-kr,latin1
endif
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" language messages zh_TW.utf-8
" }}}

" plugin manager : vundle {{{
filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here: {{{
"
" repos on github {{{
" for auto-pair
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
" Plugin 'scrooloose/nerdtree'
" Riv is a vim plugin for taking notes with reStructuredText.
" Plugin 'Rykka/riv.vim'
" let g:riv_ignored_nmaps = "<Tab>,<S-Tab>" " original <C-i>
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'tpope/vim-rails.git'
" Plugin 'fholgado/minibufexpl.vim'

" python complete plugin {{{
" good python complete plugin
" but now I am not edit python file often
" Plugin 'davidhalter/jedi-vim'

" python-mode conflict with jedi-vim
" Plugin 'klen/python-mode'
" }}}

" Syntastic : syntax checking plugin {{{
" Syntastic is a syntax checking plugin for Vim that runs files through
" external syntax checkers and displays any resulting errors to the user.
" Not test yet
" Plugin 'scrooloose/syntastic'
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['pylint']
" }}}

" Plugin 'othree/xml.vim'
" }}}

" vim-scripts repos {{{
" Doxygen plugins {{{
" Plugin 'DoxygenToolkit.vim'
" DoxygenToolkit.vim setting
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns   "
" let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
" let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
" let g:DoxygenToolkit_authorName="Kevin Wu" 
" Plugin 'DoxyGen-Syntax'
" }}}

" Plugin 'Align'
Plugin 'cmdline-completion'
Plugin 'a.vim'
"not alternate to a file/buffer which does not exist
let g:alternateNoDefaultAlternate = 1
" Plugin 'minibufexpl.vim'
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1
" Plugin 'snipMate'
Plugin 'LogiPat'
Plugin 'L9' " necessary for FuzzyFinder
Plugin 'FuzzyFinder'
Plugin 'matchit.zip'
"Plugin 'taglist.vim'
"if os == 'win'
"  let Tlist_Ctags_Cmd = 'C:\ctags58\ctags.exe'
"endif
Plugin 'LargeFile'
let g:LargeFile = 100
" Plugin 'OmniCppComplete'
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ['std', '_GLIBCXX_STD']

" Plugin 'winmanager--Fox'
" let g:winManagerWindowLayout = 'FileExplorer' 
" }}}

" non github repos {{{
" Plugin 'git://git.wincent.com/command-t.git'
" }}}
" }}}

call vundle#end()
filetype plugin indent on     " required!
" }}}

" My function {{{
if os == 'win'
  set diffexpr=MyDiff()
  function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
  else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction
endif
" }}}

" auto command {{{

"template
"autocmd BufNewFile *.cpp 0r $Vim\vimfiles\template\template.cpp

augroup filetype_
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  "disable auto comment
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

"" Only rnu in the current window
"augroup relativeNumber
"  autocmd!
"  autocmd WinEnter * setlocal rnu
"  autocmd WinLeave * setlocal nornu
"augroup END

"}}}

" map {{{
" use original CTRL-Y in insert mode
iunmap <C-Y>
" use original CTRL-V
if os == 'unix'
    unmap <C-V>
endif

" use \s to Search and replace the word under the cursor 
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Execute python file being edited with <Shift> + F5:
map <S-F5> :w<CR>:!start cmd /c % & pause<CR>

" use <C-w>a and <C-w>; to go to the leftest/rightest window
" a is leftest, and ; is right to l
map <C-w>a 10<C-w>h
map <C-w>; 10<C-w>l

" }}}

