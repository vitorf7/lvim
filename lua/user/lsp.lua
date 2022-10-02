lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = true

-- LSP Mappings
lvim.lsp.buffer_mappings.normal_mode = vim.tbl_extend("force", lvim.lsp.buffer_mappings.normal_mode, {

  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  ["gd"]  = {
    function ()
      vim.cmd[[Telescope lsp_definitions]]
    end,
    "Goto Definition",
  },
  ["gi"]  = {
    function ()
      vim.cmd[[Telescope lsp_implementations]]
    end,
    "Goto Implementation",
  },
  ["gr"]  = {
    function ()
      vim.cmd[[Telescope lsp_references]]
    end,
    "Goto References",
  },
  ["glr"]  = { vim.lsp.buf.references, "Goto references" },
  ["gca"] = {
    function ()
      vim.cmd[[Telescope lsp_code_actions]]
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
}

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}
