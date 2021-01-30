" Install recent vim (https://vim.org):
" https://github.com/vim/vim
" Be sure to compile with --enable-python3interp
" Setup vim python support

" vim-plug (https://github.com/junegunn/vim-plug)
" Plugins
" To update/install plugins... :PlugUpdate
" To remove unused plugins... :PlugClean

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
" NERDTree (https://github.com/preservim/nerdtree) file system explorer
Plug 'preservim/nerdtree'

" fzf (https://github.com/junegunn/fzf) fuzzy file finder
" Install command line utility (https://github.com/junegunn/fzf#using-git)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" CtrlP (https://github.com/ctrlpvim/ctrlp.vim) fuzzy file/buffer/mru/tag finder
Plug 'ctrlpvim/ctrlp.vim'

" silver searcher (https://github.com/ggreer/the_silver_searcher) code
" searcher
" sudo aptitude install silversearcher-ag
" vim interface provided by:
Plug 'mileszs/ack.vim'

" tagbar (https://github.com/preservim/tagbar) class outline viewer
Plug 'preservim/tagbar'
" easytags (https://github.com/xolox/vim-easytags) tag generator
Plug 'xolox/vim-easytags'
" vim-misc (https://github.com/xolox/vim-misc) miscellaneous vim routines for
" easytags
Plug 'xolox/vim-misc'

" fugitive (https://github.com/tpope/vim-fugitive) git integration
Plug 'tpope/vim-fugitive'
" vim-gitguttber (https://github.com/airblade/vim-gitgutter) git gitgutter
Plug 'airblade/vim-gitgutter'

" delimitMate (https://github.com/Raimondi/delimitMate) adds matching
" delimiters
Plug 'Raimondi/delimitMate'

" undotree (https://github.com/mbbill/undotree) show undo history
Plug 'mbbill/undotree'

" coc (https://github.com/neoclide/coc.nvim) code completion tool
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" color scheme
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-jedi',
      \'coc-json',
      \'coc-sh'
      \]

" NERDTree bindings
nnoremap <C-e><C-g> :NERDTreeFind<CR>

" tagbar bindings
nnoremap <C-e><C-t> :TagbarToggle<CR>

" FZF
nnoremap <C-e><C-f> :FZF<CR>

" CtrlP
nnoremap <A-p> :CtrlPCurFile<CR>
nnoremap <C-p> :CtrlP<CR>

" Set silver searcher as the ack program
let g:ackprg = 'ag --vimgrep'

" coc settings
source ~/.vim/coc.vim

" Interface settings
set mouse=a          " Enable mouse in all modes
set backspace=indent,eol,start " Intuitive backspacing
set number&          " Line numbers
set showcmd          " Show partial command in last line of screen
set cursorline       " Highlight the line containing the cursor
set wildmenu         " Show list of <TAB>-autocompletes
set lazyredraw       " Speeds up macros
set ruler            " Show cursor position
set laststatus=2     " Always show status line
syntax enable
highlight Comment cterm=italic

" Searching
set showmatch        " Shows matching paren
set incsearch        " Incremental search, search while typing
set hlsearch         " Highlight search results
set ignorecase       " Ignore case in searches
set smartcase        " Respect case when there is an uppercase
                     " Include \C for case sensitive search
" Remove search highlight on <CR>-/
nnoremap <CR>/ :nohlsearch<CR>

" Functional settings
set undofile " Persistent undo

" Indent settings
set smartindent
set shiftwidth=2
set tabstop=2        " Number of spaces to display for a tab charactyer
set expandtab        " Insert spaces when <TAB> key is pressed
filetype indent on   " Language specific indent

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
