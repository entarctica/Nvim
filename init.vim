" Custom
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>dd :Dashboard<CR>
nnoremap <leader>nt :NvimTreeToggle<CR>
nnoremap <leader>in :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>cd :cd ~/.config/nvim/<CR>
" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Buffers
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
nnoremap <silent>    <A-c> :BufferClose<CR>
nnoremap <silent> <C-s>    :BufferPick<CR>
nnoremap <silent>    <C-t> :tabe<CR>
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
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
    Plug 'joshdick/onedark.vim'
call plug#end()

lua require('lualine-config')
lua require('wilder-config')
lua << EOF
    require('dashboard').setup({
        theme = 'hyper',
    config = {
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'PlugUpdate', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
      },
      packages = { enable = true },
      project = { enable = false },
      footer = {},
    },
    })
EOF
lua require('nvim-tree').setup()

colorscheme tokyonight
set nowrap
set shiftwidth=4 smarttab
