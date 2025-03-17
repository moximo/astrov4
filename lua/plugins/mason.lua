-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "pyright",
        "jdtls",
        "taplo",
        "lemminx",
        "bashls",
        "sqlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
        -- add more arguments for adding more null-ls sources
        "black",
        "clang-format",
        "codelldb",
        "eslint-lsp",
        "eslint_d",
        "isort",
        "json-lsp",
        "lua-language-server",
        "prettierd",
        "rust-analyzer",
        "shfmt",
        "sonarlint-language-server",
        "sql-formatter",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vue-language-server",
        "lombok-nightly",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        "debugpy",
        "java-debug-adapter",
        "java-test",
        -- add more arguments for adding more debuggers
      })
    end,
  },
}
