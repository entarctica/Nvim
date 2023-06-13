nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>dd :Dashboard<CR>
nnoremap <leader>nt :NvimTreeToggle<CR>
nnoremap <leader>in :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>cd :cd ~/.config/nvim/<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
set clipboard=unnamedplus
lua require('init')
call plug#begin()
  Plug 'ryanoasis/vim-devicons'
  Plug 'glepnir/dashboard-nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " Recommended, not required.
  Plug 'daltonmenezes/aura-theme', { 'rtp': 'packages/neovim' }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'folke/tokyonight.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
  Plug 'gelguy/wilder.nvim'
  Plug 'mbbill/undotree'
  Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
  Plug 'dstein64/vim-startuptime'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'tpope/vim-commentary'
call plug#end()

lua require('config')
lua require("nvim-tree").setup()
lua require('wilder-config')

colorscheme aura-soft-dark
set nowrap
