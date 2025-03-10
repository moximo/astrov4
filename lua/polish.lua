-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
vim.cmd "au BufNewFile,BufRead *.http :setl ft=http"


vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.bo.formatexpr = ""
    vim.bo.formatprg = "jq"
  end,
})

-- Set up custom filetypes
vim.filetype.add {
  -- extension = {
  --   foo = "fooscript",
  -- },
  -- filename = {
  --   ["Foofile"] = "fooscript",
  -- },
  -- pattern = {
  --   ["~/%.config/foo/.*"] = "fooscript",
  -- },
}
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.tpl", "*.yaml" },
    callback = function()
      vim.bo.filetype = "helm"
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        require('nvim-dap-projects').search_project_config()
    end,
    once = true,
})
