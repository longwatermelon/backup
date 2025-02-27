""""""""""""""""""""""""""
" Plugins 
"""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'tyrannicaltoucan/vim-quantum'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'akinsho/nvim-toggleterm.lua', {'tag': '*'}
Plug 'tikhomirov/vim-glsl'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jonathanfilip/vim-lucius'
Plug 'rebelot/kanagawa.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'lervag/vimtex'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'Mofiqul/dracula.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'sainnhe/everforest'
Plug 'vim-scripts/AutoClose'
Plug 'szebniok/tree-sitter-wgsl'
Plug 'tomasiser/vim-code-dark'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

colorscheme codedark
" colorscheme dracula-soft
" colorscheme quantum

autocmd VimEnter * highlight LineNr ctermfg=white

lua require("toggleterm").setup{}

set nocompatible
" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" Plugin 'VundleVim/Vundle.vim'
" Plugin 'morhetz/gruvbox'
" Plugin 'dracula/vim', { 'name': 'dracula' }

" call vundle#end()
filetype plugin indent on

" Do not create .swp files
set noswapfile

" Number the lines.
set number

" ALWAYS spaces
set expandtab

" Turn on syntax hightlighting.
set syntax=on
set nowrap
set tabstop=4
set shiftwidth=4
set cinoptions=p0,t0,:N,=0
set cinwords=if,else,switch,case,for,while,do
set cindent

" Speed optimization
set ttyfast
set lazyredraw

" Theme
" set guifont=Fira\ Code:h14
set guifont=3270NerdFontMono-Regular:h12

" Indent Guides
let g:indentLine_enabled=1
let g:indentLine_color_term=235
let g:indentLine_char='┆'

" Comment block
vnoremap <silent> <C-k> :Commentary<cr>

" autocmd FileType nerdtree setlocal nolist

if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

let &term = "xterm-256color"
" source /etc/vimrc

map <C-l> <C-\><C-n><C-W>l
map <C-h> <C-\><C-n><C-W>h
map <C-j> <C-\><C-n><C-W>j
map <C-t> :ToggleTerm size=30<CR>

augroup TerminalAutoEnter
  autocmd!
  autocmd TermOpen * startinsert
  autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
augroup END

set grepprg=grep\ -nH\ $*

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd VimEnter * hi CocUnusedHighlight guifg=#ffffff
autocmd VimEnter * hi MatchParen cterm=underline ctermbg=none ctermfg=none
autocmd VimEnter * hi CocHintFloat guifg=#ffffff

autocmd! BufNewFile,BufRead *.vert,*.frag set ft=glsl

let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-aux-directory=build/aux',
    \   '-output-directory=build'
    \ ],
    \}

set clipboard+=unnamedplus

command! -nargs=0 NextDiag                               :call CocAction('diagnosticNext')<CR>
command! -nargs=0 PrevDiag                               :call CocAction('diagnosticPrevious')<CR>
map <C-n> :NextDiag<CR>

let NERDTreeIgnore = ['a.out', 'compile_commands.json']
" let NERDTreeShowHidden = 1

let g:livepreview_previewer = 'evince'
let g:livepreview_cursorhold_recompile = 1
let g:livepreview_engine = "xelatex"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
