" Set <leader> at the very beginning.
let mapleader=","

""""""""""""""""""""""
" Installing Plugins "
""""""""""""""""""""""

" Using vim-plug
" Neovim installation is here: https://github.com/junegunn/vim-plug#unix-1

call plug#begin()
" Colorschemes
Plug 'morhetz/gruvbox'

" TypeScript syntax highlighting
Plug 'leafgarland/typescript-vim'

" JSX syntax hightlighting
Plug 'mxw/vim-jsx'

" JavaScript syntax hightlighting
Plug 'pangloss/vim-javascript'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()

"""""""""""""""""""
" Plugin Settings "
"""""""""""""""""""

lua <<EOF
require('nvim-treesitter.configs').setup {
	ensure_installed = { "java" },
	highlight = { enable = true },
	indent = { enable = true }
}
EOF

" Map FZF to C-p
nnoremap <C-p> :FZF<CR>

nnoremap <leader>gd <Plug>(coc-definition)
xmap <leader>f <Plug>(coc-format-selected)

let g:ale_disable_lsp = 1
" let g:ale_completion_enabled = 1
" let g:ale_fix_on_save = 1
" let g:ale_completion_autoimport = 1
let g:ale_linters = {
	\ 'javascript': ['eslint', 'tsserver'],
	\ 'typescript': ['tslint', 'tsserver']}
let g:ale_fixers = {
	\ 'javascript': ['prettier', 'eslint'],
	\ 'typescript': ['prettier', 'tslint'],
	\ 'json': ['fixjson'],
	\ 'java': ['google_java_format']}

" let g:ale_json_fixjson_options = '--indent 4'

""""""""""""""
" Appearance "
""""""""""""""

" Make cursor more noticeable
set cursorline

" Make it use same highlighting as CursorColumn in default colorscheme.
highlight! link CursorLine CursorColumn

" Set colorscheme silently so there's no error message when it isn't installed.
:silent! colorscheme gruvbox

" Turn syntax highlighting on.
syntax enable

set autoindent
set hlsearch
set loadplugins
set number
set tabstop=4
set shiftwidth=4
" hi Search ctermbg=LightBlue
imap jj <Esc>

