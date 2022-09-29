lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = true

-- LSP Mappings
-- local lvim_lsp_n_mappings = require "lvim.lsp.config".buffer_mappings.normal_mode
-- lvim_lsp_n_mappings["<leader>rn"] = { vim.lsp.buf.rename, "Rename" }
-- lvim_lsp_n_mappings["gl"] = {
--   function()
--     vim.cmd[[lua require('telescope.builtin').lsp_implementations(require('telescope.themes').get_dropdown())<cr>]]
--   end,
--   "Goto Implementation",
-- }


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
}

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}
