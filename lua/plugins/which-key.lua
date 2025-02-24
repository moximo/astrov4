-- By adding to the which-key config and using our helper function you can add more which-key registered bindings
--

return {
  "folke/which-key.nvim",
  config = function(plugin, opts)
    -- Add bindings which show up as group name
    local wk = require "which-key"
    wk.add {
      { "<leader>a", group = "ChatGPT" },
      { "<leader>ac", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
      {
        "<leader>ae",
        "<cmd>ChatGPTEditWithInstruction<CR>",
        desc = "ChatGPT Edit with instruction",
        mode = { "n", "v" },
      },
      {
        "<leader>ag",
        "<cmd>ChatGPTRun grammar_correction<CR>",
        desc = "ChatGPT Grammar Correction",
        mode = { "n", "v" },
      },
      {
        "<leader>atz",
        "<cmd>ChatGPTRun translate chiness<CR>",
        desc = "ChatGPT Translate to chiness",
        mode = { "n", "v" },
      },
      {
        "<leader>ate",
        "<cmd>ChatGPTRun translate english<CR>",
        desc = "ChatGPT Translate to english",
        mode = { "n", "v" },
      },
      { "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", desc = "ChatGPT Keywords", mode = { "n", "v" } },
      { "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", desc = "ChatGPT Docstring", mode = { "n", "v" } },
      { "<leader>aa", "<cmd>ChatGPTRun add_tests<CR>", desc = "ChatGPT Add Tests", mode = { "n", "v" } },
      { "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", desc = "ChatGPT Optimize Code", mode = { "n", "v" } },
      { "<leader>as", "<cmd>ChatGPTRun summarize<CR>", desc = "ChatGPT Summarize", mode = { "n", "v" } },
      { "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "ChatGPT Fix Bugs", mode = { "n", "v" } },
      { "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", desc = "ChatGPT Explain Code", mode = { "n", "v" } },
      { "<leader>ar", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "ChatGPT Roxygen Edit", mode = { "n", "v" } },
      {
        "<leader>al",
        "<cmd>ChatGPTRun code_readability_analysis<CR>",
        desc = "ChatGPT Code Readability Analysis",
        mode = { "n", "v" },
      },
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
