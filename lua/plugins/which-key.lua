-- By adding to the which-key config and using our helper function you can add more which-key registered bindings
--

return {
  "folke/which-key.nvim",
  config = function(plugin, opts)
    -- Add bindings which show up as group name
    local wk = require "which-key"
    wk.add {
      { "<leader>r", group = "rest http client" },
      { "<leader>rh", "<cmd>Rest run<CR>", desc = "run rest http clent" },
      { "<leader>rc", "<cmd>Rest curl comment<CR>", desc = "show rest curl" },

      { "<leader>lt", group = "lsp test" },
      { "<leader>ltr", ':lua require("neotest").run.run()<CR>', desc = "run test", mode = { "n", "v" } },
      {
        "<leader>ltd",
        ':lua require("neotest").run.run({strategy = "dap"})<CR>',
        desc = "run test dap",
        mode = { "n", "v" },
      },
      {
        "<leader>lto",
        ':lua require("neotest").output.open({ enter = true,auto_close=true })<CR>',
        desc = "show test output",
        mode = { "n", "v" },
      },
      {
        "<leader>ltlo",
        ':lua require("neotest").output.open({ enter = true,last_run=true,auto_close=true})<CR>',
        desc = "show last test output",
        mode = { "n", "v" },
      },
      { "<leader>ltlr", ':lua require("neotest").run.run_last()', desc = "run last test", mode = { "n", "v" } },
      {
        "<leader>ltld",
        ':lua require("neotest").run.run_last({strategy = "dap"})<CR>',
        desc = "run last test dap",
        mode = { "n", "v" },
      },
      {
        "<leader>ltp",
        ':lua require("neotest").output_panel.toggle()<CR>',
        desc = "show test output-anel",
        mode = { "n", "v" },
      },
      {
        "<leader>lty",
        ':lua require("neotest").summary.toggle()<CR>',
        desc = "show test summary",
        mode = { "n", "v" },
      },
      { "<leader>lts", ':lua require("neotest").run.stop()<CR>', desc = "stop test", mode = { "n", "v" } },
      { "<leader>lta", ':lua require("neotest").run.attach()<CR>', desc = "attach test", mode = { "n", "v" } },
      { "<leader>d", group = "debug" },
      {
        "<leader>dK",
        ':lua require("dapui").float_element("scopes", {width=80,height=40,enter=true,position=true})<CR>',
        desc = "debug float",
        mode = { "n", "v" },
      },
      {
        "<leader>ud",
        ":UndotreeToggle<CR>",
        desc = "show undotree",
        mode = { "n", "v" },
      },
      {
        "<c-\\>",
        "<cmd>ToggleTerm<CR>",
        desc = "open terminal",
        mode = { "v","n" },
      },
      {
        "<leader>ts",
        "<cmd>TermSelect<CR>",
        desc = "select terminal",
        mode = { "v","n" },
      },
    }
  end,
}
