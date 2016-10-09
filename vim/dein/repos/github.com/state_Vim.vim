let [plugins, ftplugin] = dein#load_cache_raw(['/Users/Kazuki/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/Kazuki/.vim/dein/repos/github.com'
let g:dein#_runtime_path = '/Users/Kazuki/.vim/dein/repos/github.com/.dein'
let &runtimepath = '/Users/Kazuki/.vim,/Users/Kazuki/.vim/dein/repos/github.com/.dein,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,/Users/Kazuki/.vim/after,/Applications/MacVim.app/Contents/Resources/vim/plugins/autofmt,/Applications/MacVim.app/Contents/Resources/vim/plugins/golang,/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimdoc-ja,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimproc,/Users/Kazuki/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/Kazuki/.vim/dein/repos/github.com/.dein/after'
filetype off
