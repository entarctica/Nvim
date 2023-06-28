set clipboard+=unnamedplus
" Key Remaps
    " Function shortcuts
	nnoremap <leader>sv <cmd>source $MYVIMRC<CR>
	nnoremap <leader>pi <cmd>PlugInstall<CR>
	nnoremap <leader>dd <cmd>Dashboard<CR>
	nnoremap <leader>in <cmd>e ~/.config/nvim/init.vim<CR>
	nnoremap <leader>cd <cmd>cd ~/.config/nvim/<CR>
	" Trees
	nnoremap <silent> <A-q> <cmd>NvimTreeToggle<CR>
	nnoremap <silent> <A-u> <cmd>UndotreeToggle<CR>
	" Hop
	nnoremap <silent> <S-f> <cmd>HopWord<CR>
	vnoremap <silent> <S-f> <cmd>HopWord<CR>
	" Telescope
	nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
	nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
	nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
	nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
	" Buffers
	nnoremap <silent> <A-,> <cmd>BufferPrevious<CR>
	nnoremap <silent> <A-.> <cmd>BufferNext<CR>
	nnoremap <silent> <A-c> <cmd>BufferClose<CR>
	nnoremap <silent> <C-s> <cmd>BufferPick<CR>
	nnoremap <silent> <C-t> <cmd>tabe<CR>
    " Fold
	nnoremap <space> za
    " Terminal escape
	tnoremap <Esc> <C-\><C-n>
    " Split nav
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>
    " Clipboard
	" nnoremap y "+y
	" vnoremap y "+y
	" nnoremap p "+p
	" vnoremap p "+p
	" nnoremap x "+x
	" vnoremap x "+x
	" nnoremap d "+d
	" vnoremap d "+d
	" nnoremap YY ggVGy

lua require('init')
" Plugins
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
	" Plug 'jayli/vim-easycomplete'
	Plug 'SirVer/ultisnips'	
	Plug 'kassio/neoterm'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'github/copilot.vim'
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
	Plug 'rose-pine/neovim'
    call plug#end()

" Configs
    lua require('lualine-config')
    lua require('wilder-config')
    lua require('dashboard-config')
    lua require('nvim-tree-config')
    lua require('hop-config')
" Misc
    set undofile
    colorscheme tokyonight
    set nowrap
    set shiftwidth=4 smarttab
    set ignorecase
    set smartcase
    " Folding
    set foldcolumn=2
    autocmd FileType vim setlocal foldmethod=indent
    set fillchars+=fold:\ 
    highlight Folded guibg=NONE
    " Save/Load folds automatically
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview    
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


