vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = { "*.go" },
  callback = function ()
    vim.cmd [[silent! lua require('go.format').gofmt()]]
  end
})
