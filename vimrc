if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
let s:cache_home = expand('~/.cache')
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
let s:toml_file = '~/.vim/dein.toml'
let s:toml_file_lazy = '~/.vim/dein_lazy.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
    runtime! vim/conf.d/*.conf
    call dein#load_toml(s:toml_file, {'lazy': 0})
    call dein#load_toml(s:toml_file_lazy, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
