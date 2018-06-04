    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_general_viewer = 'zathura'
    source ~/.vimrc
