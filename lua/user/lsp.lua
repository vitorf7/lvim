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
  "gomod",
	"php",
	"hcl",
}

-- language server in the table below will automatically be installed
lvim.lsp.installer.setup.ensure_installed = {
  "sumeko_lua",
  "jsonls",
  "html",
  "yamlls",
  "dockerls",
  "bashls",
  "bufls",
  "golangci-lint-langserver",
  "intelephense",
  "phpactor",
  "tflint",
  "terraformls",
  "marksman",
}

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "buf", filetypes = { "proto" } },
	{ command = "markdownlint", filetypes = { "markdown", "md" } },
	{ command = "terraform_fmt", filetypes = { "terraform", "tf" } },
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt", filetypes = { "go" } },
})

-- set a linter, this will override the language server linting capabilities (if it exists)
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "buf", filetypes = { "proto" } },
	-- { command = "phpcs", filetypes = { "php" } },
	{ command = "selene", filetypes = { "lua" } },
	-- { command = "luacheck", filetypes = { "lua" } },
	{ command = "markdownlint", filetypes = { "markdown", "md" } },
	{ command = "cfn_lint", filetypes = { "yaml", "json" } },
})

-- LSP Server Settings
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })
local lsp_manager = require("lvim.lsp.manager")

-- Golang
lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
      },
    },
  },
})

lsp_manager.setup("bufls")
lsp_manager.setup("terraform_lsp")
lsp_manager.setup("terraformls")
lsp_manager.setup("tflint")
lsp_manager.setup("marksman")
-- lsp_manager.setup("phpactor")
