local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()

lvim.builtin.which_key.mappings["dT"] = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" }
