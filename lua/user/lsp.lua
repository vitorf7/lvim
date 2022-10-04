lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = true

-- LSP Mappings
lvim.lsp.buffer_mappings.normal_mode = vim.tbl_extend("force", lvim.lsp.buffer_mappings.normal_mode, {
	["gd"] = {
		function()
			vim.cmd([[Telescope lsp_definitions]])
		end,
		"Goto Definition",
	},
	["gi"] = {
		function()
			vim.cmd([[Telescope lsp_implementations]])
		end,
		"Goto Implementation",
	},
	["gr"] = {
		function()
			vim.cmd([[Telescope lsp_references]])
		end,
		"Goto References",
	},
	["glr"] = { vim.lsp.buf.references, "Goto references" },
	["gca"] = {
		function()
			vim.cmd([[Telescope lsp_code_actions]])
		end,
		"LSP Code Actions",
	},
	["<leader>rn"] = { vim.lsp.buf.rename, "LSP Rename" },
})

lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = {
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"yaml",
	"go",
	"php",
	"hcl",
}

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "buf", filetypes = { "proto" } },
	{ command = "markdownlint", filetypes = { "markdown", "md" } },
	{ command = "terraform_fmt", filetypes = { "terraform", "tf" } },
})

-- set a linter, this will override the language server linting capabilities (if it exists)
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "buf", filetypes = { "proto" } },
	{ command = "phpcs", filetypes = { "php" } },
	{ command = "selene", filetypes = { "lua" } },
	{ command = "luacheck", filetypes = { "lua" } },
	{ command = "markdownlint", filetypes = { "markdown", "md" } },
	{ command = "cfn_lint", filetypes = { "yaml", "json" } },
})

-- LSP Server Settings

local lsp_manager = require("lvim.lsp.manager")

lsp_manager.setup("golangci_lint_ls")
lsp_manager.setup("bufls")
lsp_manager.setup("terraform_lsp")
lsp_manager.setup("terraformls")
lsp_manager.setup("tflint")
