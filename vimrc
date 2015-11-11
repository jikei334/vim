" 基本設定
set number
set showmode
set title
set ruler
set showcmd
set showmatch
set laststatus
set pumheight=10
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

if has("syntax")
  syntax on
endif

" キーマップ
let mapleader = ","
let maplocalleader="<Space>"
" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Tags
if has("path_extra")
  set tags+=tags;
endif
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
set tags+=.svn/tags

" プラグイン
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundleLazy "majutsushi/tagbar", {
      \ "autoload": { "commands": ["TagbarToggle"] }}
NeoBundleLazy "wesleyche/SrcExpl", {
      \ "autoload" : { "commands": ["SrcExplToggle"]}}

call neobundle#end()
NeoBundleCheck
filetype plugin indent on


" tagbar
if ! empty(neobundle#get("tagbar"))
   " Width (default 40)
  let g:tagbar_width = 20
  " Map for toggle
  nn <silent> <leader>t :TagbarToggle<CR>
endif

" SrcExpl
if ! empty(neobundle#get("SrcExpl"))
  " Set refresh time in ms
  let g:SrcExpl_RefreshTime = 1000
  " Is update tags when SrcExpl is opened
  let g:SrcExpl_isUpdateTags = 0
  " Tag update command
  let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
  " Update all tags
  function! g:SrcExpl_UpdateAllTags()
    let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
    call g:SrcExpl_UpdateTags()
    let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
  endfunction
  " Source Explorer Window Height
  let g:SrcExpl_winHeight = 14
  " Mappings
  nn [srce] <Nop>
  nm <Leader>E [srce]
  nn <silent> [srce]<CR> :SrcExplToggle<CR>
  nn <silent> [srce]u :call g:SrcExpl_UpdateTags()<CR>
  nn <silent> [srce]a :call g:SrcExpl_UpdateAllTags()<CR>
  nn <silent> [srce]n :call g:SrcExpl_NextDef()<CR>
  nn <silent> [srce]p :call g:SrcExpl_PrevDef()<CR>
endif

