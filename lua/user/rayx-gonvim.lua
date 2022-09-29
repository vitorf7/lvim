local status_ok, rayx_go_nvim = pcall(require, "go")
if not status_ok then
  return
end

local lvim_lsp = require "lvim.lsp"
local capabilities = lvim_lsp.common_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
rayx_go_nvim.setup({
  goimport = "gopls",
  max_line_len = 140,
  lsp_keymaps = false,
  lsp_codelens = true,
  dap_debug = true,
  dap_debug_gui=true,
  run_in_floaterm = true,
})
