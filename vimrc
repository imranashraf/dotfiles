set tabstop=4
set expandtab 
set shiftwidth=4
set ignorecase 
set number        " show line numbers  
set showmode
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many undo levels (undo u, redo Ctrl+r)
set nocompatible
let mapleader = ","

" this plugin is required for filetype operations for instance nerd commenting
filetype plugin on

" simple indentation (not being used in favor of filetype based below)
"set autoindent
"set smartindent
"set cindent

" filetype based indentation
filetype plugin indent on

set t_Co=256
" Syntax highlighting
if &t_Co >= 256 || has("gui_running")
   colorscheme mustangModified
   "colorscheme mustang
else
    colorscheme evening
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" map F3 to :set paste which is used to paste text without weired indentation
set pastetoggle=<F3>

" set out tab characters/trailing space show
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Quickly edit/reload the vimrc file
" maps the ,ev and ,sv keys to edit/reload .vimrc.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>


" The following commands to copy to system clipboard will work only if the
" vim is compiled with +xterm_clipboard option. This may require re-compiling
" the vim and enabling this option or in ubuntu by installing vim-gtk by:
" sudo apt-get install vim-gtk
vnoremap <C-c> "+y
inoremap <C-V> p

" select all with Ctrl-A
"map <C-A> ggvG

"These are to cancel the default behavior of d, D, c, C
"  to put the text they delete in the default register.
"  Note that this means e.g. "ad won't copy the text into
"  register a anymore.  You have to explicitly yank it.
"nnoremap d "_d
"vnoremap d "_d
"nnoremap D "_D
"vnoremap D "_D
"nnoremap c "_c
"vnoremap c "_c
"nnoremap C "_C
"vnoremap C "_C

" Ctrl-Space for completion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Auto-completion menu
set wildmode=list:longest

" More useful command-line completion
set wildmenu

" http://www.vim.org/scripts/script.php?script_id=1879
" autocompletion as you type plugin

" set mouse=a

" Nerdcommenter if available will allow intelligent commenting of code
" ,cc to comment
" ,cu to uncomment

" Set region to British English for spell checking etc
set spelllang=en
" spell checking can be toggled by pressing ,s
nmap <silent> <leader>s :set spell!<CR>

" for red color marker at 80 col
"set colorcolumn=81
" or change text color after 80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" for red color text indication after 80 col
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" to do hard wrap. command vip selects a paragraph and then pressing gq
" will wrap it automatically to the textwidth.
set textwidth=80
set formatoptions+=t

" to save a file with 2 Esc keys
map <silent><leader>w :w<CR>

" to quit with ,q
map <silent><leader>q :q<CR>

" ,W to write file as sudo
noremap <Leader>W :w !sudo tee % > /dev/null

" in order to un map Q to avoid entring ex mode
"nnoremap Q <nop>
" Use Q for formatting the current paragraph (or selection) useful in latex
"vmap Q gq
"nmap Q gqap

" strips off two full keystrokes from almost every Vim command:
nnoremap ; :
" above is similar to the following
" saves time, press space and start typing command
"nmap <space> :

" map ,/ or Esc Esc  to clear search (unhighlight)
nmap <silent> <leader>/ :nohlsearch<CR>
"following prints weired characters when pressing Esc followed by arrow keys
"nmap <Esc><Esc> :nohlsearch<CR>

" to reload file
map <silent> <F5> :edit<CR>

" ~ to change case of selected text
"F5           Capitalize selection, title case
"Shift+F5     Uppercase selection
"Alt+F5       Lowercase selection
"Ctrl+F5      Reverse case of selection

" ZZ to save and exit current file
" ZQ to exit without saving current file

" make vim reserve the clipboard even after exit. install xsel as well
autocmd VimLeave * call system("xsel -ib", getreg('+'))

"Display current cursor position in lower right corner.
set ruler

"Show command in bottom right portion of the screen
set showcmd

" Always show the status line
set laststatus=1

" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>l

" Split windows below the current window.
set splitbelow

"Map escape key to jj -- much faster
imap jj <esc>

" set maximum tab limit
set tabpagemax=30

" for pathogen to easily install plugins
execute pathogen#infect()

" for vimairline
let g:airline#extensions#tabline#enabled=1

" for buffers
set wildchar=<Tab> wildmenu wildmode=full

" switch buffers with Tab and Shift+Tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" a specific buffer can also be opened by typing
"  :b < [part of] buffer name >

" TABS
" tabe <name of file to open in new tab> can be used to open a tab, then
" gt go to  next tab
" gT go to  prev tab

"added the script from here in .vim/indent directory to fix python indentation
"http://www.vim.org/scripts/script.php?script_id=974

"to search visual, a plugin is add in .vim/plugin directory
"using the following maps Ctrl+R key to replace visually selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

