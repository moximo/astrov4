-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      {
        "html",
        "css",
        "vim",
        "javascript",
        "typescript",
        "c",
        "cpp",
        "python",
        "json",
        "rust",
        "lua",
        "xml",
        "http",
        "graphql",
      },
      -- 启用代码高亮
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      --启用增量选择
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selaction = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        },
      },
      -- 启用基于 Treesitter 的代码格式化(=)
      indent = {
        enable = true,
      },
    })
  end,
}
