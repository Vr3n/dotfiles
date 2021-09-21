set exrc
set number
set relativenumber
set nohlsearch
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
syntax enable
set scrolloff=8
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set incsearch
set noerrorbells
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set splitbelow
set splitright
set signcolumn=yes
highlight Normal guibg=none ctermbg=NONE

" ---- Installing Pluggins ---- "
call plug#begin('~/.vim/plugged')

" afterglow colorscheme.
Plug 'danilo-augusto/vim-afterglow'

" nerdtree for file navigation.
Plug 'preservim/nerdtree'

" Vim maximizer.
Plug 'szw/vim-maximizer'

" Vim Inspector - vscode like debugger.
Plug 'puremourning/vimspector'

" Vscode Color Theme.
Plug 'tomasiser/vim-code-dark'

" Nvim transparent background.
Plug 'xiyaowong/nvim-transparent'

" coc for tslinting, auto complete and prettier.
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Git plugin.
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Lexima for Autoclosing parenthesis.
Plug 'cohama/lexima.vim'

" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'

" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'


" Javascript highlighting and syntax support.
Plug 'pangloss/vim-javascript'

" Bracket colorizer
Plug 'luochen1990/rainbow'

" AutoPairs - automatic quote and bracket completion.
Plug 'jiangmiao/auto-pairs'

" Comment style change for current file based on its file type.
Plug 'scrooloose/nerdcommenter'

" telescope.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Vim airline.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" JSX support.
Plug 'maxmellon/vim-jsx-pretty'

" Emmet.
Plug 'mattn/emmet-vim'


" Asynchronous 
Plug 'w0rp/ale'

" Python Code folding.
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'

" Python Indetation.
Plug 'vim-scripts/indentpython.vim'

" MultiCursor Editing.
Plug 'terryma/vim-multiple-cursors'

call plug#end()
" --- INSTALLING PLUGINS END --- "
let g:python3_host_prog=expand('/usr/bin/python3')

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

" emmet configurations.
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings={
    \ 'javascript.jsx': {
        \    'extends': 'jsx',
    \ },
    \ }


" colorscheme settings.
set t_Co=256

colorscheme codedark

hi Error ctermfg=Red guifg=Red
hi ColorColumn guibg=black
autocmd Syntax c,cpp,vim,xml,html,xhtml,python normal zR

" Airline theme.
let g:airline_theme='codedark'

" Rainbow brackets config.
let g:rainbow_active=1

" Transparent Background config.
lua << EOF
require("transparent").setup{
  enable = true
}

EOF

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

" Code folding config.
let g:SimpylFold_docstring_preview=1

hi Folded guibg=#071524 guifg=#fff2e6

" vimspector config.
let g:vimspector_enable_mappings='HUMAN'

" Key remaps.
let mapleader = " "

imap jk <Esc>
" Select all
nmap <C-a> gg<S-v>G

" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <leader>s <C-w>w
map <leader>h <C-w>h
map <leader>k <C-w>k
map <leader>j <C-w>j
map <leader>l <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l


" nerdtree remaps.
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Telescope Remaps.
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Maximizer keymaps.
nnoremap <leader>mf :MaximizerToggle<CR>

" Vimspector remps.
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
nnoremap <Leader>dd :call vimspector#Launch()<cr>
nnoremap <Leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <Leader>dt :call GotoWindow(g:vimspector_session_windows.tabpage)<CR>
nnoremap <Leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <Leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <Leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <Leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <Leader>de :call vimspector#Reset()<cr>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorStepOut
nnoremap <leader>c<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" Telescope ignore file.
lua << EOF 
require('telescope').setup { 
    defaults = { 
        file_ignore_patterns = { "node_modules" } 
    } 
}
EOF 

