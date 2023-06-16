" Custom
    nnoremap <leader>sv :source $MYVIMRC<CR>
    nnoremap <leader>pi :PlugInstall<CR>
    nnoremap <leader>dd :Dashboard<CR>
    nnoremap <leader>nt :NvimTreeToggle<CR>
    nnoremap <leader>in :e ~/.config/nvim/init.vim<CR>
    nnoremap <leader>cd :cd ~/.config/nvim/<CR>
    nnoremap <space> za
    tnoremap <Esc> <C-\><C-n>
    nnoremap y "+y
    vnoremap y "+y
    nnoremap p "+p
    vnoremap p "+p
    nnoremap x "+x
    vnoremap x "+x
    nnoremap YY ggVGy
" Telescope
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Buffers
    nnoremap <silent>    <A-,> :BufferPrevious<CR>
    nnoremap <silent>    <A-.> :BufferNext<CR>
    nnoremap <silent>    <A-c> :BufferClose<CR>
    nnoremap <silent>    <C-s> :BufferPick<CR>
    nnoremap <silent>    <C-t> :tabe<CR>

lua require('init')

call plug#begin()
    " Unsorted
	Plug 'ryanoasis/vim-devicons'
	Plug 'glepnir/dashboard-nvim'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " Recommended, not required.
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
	Plug 'gelguy/wilder.nvim'
	Plug 'mbbill/undotree'
	Plug 'dstein64/vim-startuptime'
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'tpope/vim-commentary'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'romgrk/barbar.nvim'
	Plug 'jayli/vim-easycomplete'
	Plug 'SirVer/ultisnips'
	Plug 'kassio/neoterm'
    " Navigation
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'phaazon/hop.nvim'
    " Themes
	Plug 'daltonmenezes/aura-theme', { 'rtp': 'packages/neovim' }
	Plug 'joshdick/onedark.vim'
	Plug 'folke/tokyonight.nvim'
	Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
	Plug 'sainnhe/edge'
	Plug 'rebelot/kanagawa.nvim'
call plug#end()

" Configs
    lua require('lualine-config')
    lua require('wilder-config')
    lua require('dashboard-config')
    lua require('nvim-tree-config')
    lua require('hop-config')
" Misc
    colorscheme tokyonight
    set nowrap
    set shiftwidth=4 smarttab
    set foldcolumn=2
    set ignorecase
    set smartcase
    autocmd FileType vim setlocal foldmethod=indent
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview    
    autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
" Functions
    " Print the result of the input arg to a new tab
    function PrintToReg(arg)
	redir => var
	silent execute a:arg
	redir END
	tabe
	put =var
    endfunction
    command! -nargs=+ -complete=command PrintToReg call PrintToReg(<q-args>)

