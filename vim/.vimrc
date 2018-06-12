
""" Auto Installation

if empty(glob("~/.vim/autoload/plug.vim"))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    auto VimEnter * PlugInstall
endif

if !empty(glob("~/.fzf/bin/fzf"))
    if empty(glob("~/.fzf/bin/rg"))
        silent !curl -fLo /tmp/rg.tar.gz
                    \ https://github.com/BurntSushi/ripgrep/releases/download/0.4.0/ripgrep-0.4.0-x86_64-unknown-linux-musl.tar.gz
        silent !tar xzvf /tmp/rg.tar.gz --directory /tmp
        silent !cp /tmp/ripgrep-0.4.0-x86_64-unknown-linux-musl/rg ~/.fzf/bin/rg
    endif
endif

if empty(glob("~/.vim/colors/lucius.vim"))
    silent !curl -fLo ~/.vim/colors/lucius.vim --create-dirs
                \ https://raw.githubusercontent.com/bag-man/dotfiles/master/lucius.vim
endif

if !isdirectory($HOME . "/.vim/undodir")
    call mkdir($HOME . "/.vim/undodir", "p")
endif

"Easier ESC?
inoremap kj <ESC>


"Custom remaps 
nnoremap J :bprev<CR>
nnoremap K :bnext<CR>
nnoremap <C-m> :bnext<CR>
nnoremap <C-n> :bprev<CR>

"Beginning of line
map H ^
"End of line
map L $

nnoremap <s-tab> :bprev<CR>
nnoremap <C-t> :bnew<CR>
nnoremap <C-b> :Beautify<CR>
inoremap <C-t> <Esc>:bnew<CR>i

".vimrc
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" undo stuff, not sure i like this
set undofile
set undodir=~/.vim/undodir

"FZF
nmap <C-p> :Files<cr>
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-i': 'split',
            \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }

let g:rg_command = '
            \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
            \ -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
            \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)


"Misc
set ignorecase
set incsearch
set smartcase
set scrolloff=10
set hlsearch!
set hidden
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let g:NERDTreeHijackNetrw = 0 
let g:ranger_replace_netrw = 1 
let g:prettier#exec_cmd_async = 1
let g:deoplete#enable_at_startup = 1




"Javascript


call plug#begin('~/.vim/plugged')
filetype plugin indent on

" Features
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }    " Install fzf for user
Plug 'junegunn/fzf.vim'                                              " Fzf vim plugin
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'francoiscabrol/ranger.vim'
"Plug 'wesQ3/vim-windowswap'
"Plug 'zhamlin/tiler.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1



" Small utilities
Plug 'rbgrouleff/bclose.vim'                                         " Close current buffer
Plug 'matze/vim-move'                                                " Move lines up and down



" Languages
Plug 'moll/vim-node'                                                 " Syntax for node.js
Plug 'wavded/vim-stylus'                                             " Stylus for stylus
Plug 'lervag/vimtex'                                                 " Build LaTeX files
Plug 'josudoey/vim-eslint-fix'                                       " Eslint fixamajig
"Plug 'othree/yajs.vim'                                             " javascript
Plug 'zeekay/vim-beautify'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'maksimr/vim-jsbeautify'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'fatih/vim-go'

" Snippets
"Plug 'SirVer/ultisnips'                                              " Snippet engine
Plug 'isRuslan/vim-es6'                                              " ES6 snippets
Plug 'bag-man/snipmate-mocha'                                        " Snippets for Mocha tests

" tpope
Plug 'tpope/vim-surround'                                            " Operate on surrounding 
Plug 'tpope/vim-speeddating'                                         " Increment dates
Plug 'tpope/vim-repeat'                                              " Repeat plugins
Plug 'tpope/vim-commentary'                                          " Comment out blocks
Plug 'tpope/vim-fugitive'                                            " Git integration
Plug 'tpope/vim-abolish'                                             " Flexible search
Plug 'tpope/vim-jdaddy'                                              " JSON text object
Plug 'tpope/vim-rhubarb'                                             " Github browse

" Appearance
Plug 'mkitt/tabline.vim'                                             " Cleaner tabs
Plug 'chrisbra/Colorizer'                                            " Show hex codes as colours
Plug 'suan/vim-instant-markdown'                                     " Markdown preview instant-markdown-d
Plug 'chriskempson/base16-vim'                                       " color scheme
Plug 'morhetz/gruvbox'                                               " color scheme
Plug 'NLKNguyen/papercolor-theme'                                      " color scheme
Plug 'nightsense/vimspectr'



" Text objects
Plug 'wellle/targets.vim'                                            " Additional text objects                   
Plug 'michaeljsmith/vim-indent-object'                               " Indented text object
Plug 'kana/vim-textobj-user'                                         " Add additional text objects
Plug 'jceb/vim-textobj-uri'                                          " URL objects
Plug 'glts/vim-textobj-comment'                                      " Comment text objects
Plug 'kana/vim-textobj-function'                                     " Add function based text objects
Plug 'bag-man/vim-textobj-keyvalue'                                  " Key value object
Plug 'thinca/vim-textobj-function-javascript'                        " Add JS function object
Plug 'reedes/vim-textobj-sentence'                                   " Sentence object
Plug 'nightsense/vimspectr'

call plug#end()


""" Appearance
syntax on
set number relativenumber
set nowrap

set t_Co=256
"set t_Co=256
set background=dark
"set t_Co=16


"colorscheme base16-gruvbox-dark-hard  
colorschem vimspectrgrey-dark 
"let base16colorspace=256


hi LineNr  ctermbg=none 
hi CursorLineNR ctermbg=236
hi Normal ctermbg=none
hi Search ctermfg=none ctermbg=238
hi SignColumn ctermbg=none ctermfg=240
hi TabLineFill ctermbg=none ctermfg=240
hi PmenuSel ctermbg=none ctermfg=250
hi TabLine ctermbg=none ctermfg=240

hi TabLineSel ctermbg=none ctermfg=245

hi Whitespace ctermfg=236 


set cindent
set expandtab
set shiftwidth=2
set softtabstop=2

set laststatus=2
set statusline=%F
set wildmenu
set showcmd

"match Delimiter /\d\ze\%(\d\d\%(\d\{3}\)*\)\>/

set showmatch
set listchars=tab:>-,trail:· " Show tabs and trailing space
set list
hi SpecialKey ctermfg=236 

hi Pmenu ctermbg=236 ctermfg=240
hi PmenuSel ctermfg=250 
hi PmenuSbar ctermbg=0


"set expandtab ts=4 sw=4 ai
"set expandtab ts=4 sw=4 ai
"set list lcs=tab:\|\ 

" first, enable status line always
set laststatus=2

hi StatusLine ctermbg=none 
hi  VertSplit ctermbg=none ctermfg=none
"set fillchars+=vert:\ 

"let g:UltiSnipsUsePythonVersion = 3
let g:indentLine_leadingSpaceEnabled = 1

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:buftabline_show = 1
let g:buftabline_numbers = 0


set virtualedit=onemore
set noshowmode

"let NERDTreeShowHidden=1
"let NERDTreeMinimalUI=1
"let NERDTreeDirArrows=1
"let NERDTreeWinSize=50


let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ }



set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set swb=useopen

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Tiling wm in vim, because why not
    nmap <C-W>n <plug>TilerNew
    nmap <C-W>s <plug>TilerNew
    nmap <C-W>v <plug>TilerNew
    nmap <C-W>q <plug>TilerClose
    nmap <C-W>. <plug>TilerRotateForwards
    nmap <C-W>, <plug>TilerRotateBackwards

    nmap <C-w><space> <Plug>TilerZoom
    nmap <C-Space> <Plug>TilerFocus

    nmap <C-W>k <Plug>TilerAddMaster
    nmap <C-W>j <Plug>TilerDelMaster
    nmap <C-W>l <Plug>TilerRotateLayoutR
    nmap <C-W>h <Plug>TilerRotateLayoutL

    " not specific to tiler, but useful for window navigation.
    nmap <C-J> :wincmd j<CR>
    nmap <C-k> :wincmd k<CR>
    nmap <C-l> :wincmd l<CR>
    nmap <C-h> :wincmd h<CR>


nnoremap <Leader>b :ls<CR>:sb<Space>


" Whitespaces

" show leading spaces
hi Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey
autocmd BufWinEnter * setl conceallevel=2 concealcursor=nv
autocmd BufWinEnter * syn match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
autocmd BufReadPre * setl conceallevel=2 concealcursor=nv
autocmd BufReadPre * syn match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
