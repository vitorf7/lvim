-- Additional Plugins
lvim.plugins = {
  "EdenEast/nightfox.nvim",
	"j-hui/fidget.nvim",
	"kylechui/nvim-surround",
	-- "christianchiarulli/harpoon",
	-- "MattesGroeger/vim-bookmarks",
	"folke/todo-comments.nvim",
	-- "windwp/nvim-spectre",
	{
		"0x100101/lab.nvim",
		run = "cd js && npm ci",
	},
	"folke/zen-mode.nvim",
	"lvimuser/lsp-inlayhints.nvim",

  "alexghergh/nvim-tmux-navigation",

  -- Waka Time
  "wakatime/vim-wakatime",

  -- PHP
  'tpope/vim-dispatch',
  'StanAngeloff/php.vim',
  'stephpy/vim-php-cs-fixer',
  'jwalton512/vim-blade',
  'noahfrederick/vim-laravel',

  -- Golang
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",

	-- https://github.com/jose-elias-alvarez/typescript.nvim
	-- "rmagatti/auto-session",
	-- "rmagatti/session-lens"
}
