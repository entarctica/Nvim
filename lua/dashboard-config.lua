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
	{
	  icon = '󰖷 ',
	  desc = 'Init',
	  group = 'number',
	  action = ':e ~/.config/nvim/init.vim',
	  key = 'i',
	},
      },
      packages = { enable = false },
      project = { enable = false },
      footer = {},
    },
})
