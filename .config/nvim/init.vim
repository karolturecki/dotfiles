" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" List of plugins
Plug 'wakatime/vim-wakatime'                      " WakaTime plugin for time tracking
Plug 'windwp/nvim-autopairs'                      " Auto pairs for inserting brackets and quotes
Plug 'catppuccin/nvim', {'as': 'catppuccin'}      " Catppuccin colorscheme
Plug 'airblade/vim-gitgutter'                     " Git gutter to show git diffs
Plug 'ycm-core/YouCompleteMe'                     " YouCompleteMe for code completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter for better syntax highlighting
Plug 'ryanoasis/vim-devicons'                     " Icons for file types
Plug 'preservim/nerdtree'                         " NERDTree for file navigation

" End vim-plug initialization
call plug#end()

" Treesitter configuration
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "python", "lua", "javascript", "html", "css" }, -- List of languages
  highlight = {
    enable = true,  -- Enable highlighting
  },
}
EOF

" Catppuccin colorscheme configuration
lua << EOF
require("catppuccin").setup({
    flavour = "frappe"  -- Set flavour to 'frappe'
})
vim.cmd[[colorscheme catppuccin]]
EOF

" Map <F2> to toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>


" Nvim-autopairs configuration
lua << EOF
require('nvim-autopairs').setup{}
EOF

set number
