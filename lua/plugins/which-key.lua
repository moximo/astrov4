-- By adding to the which-key config and using our helper function you can add more which-key registered bindings
--

return {
  "folke/which-key.nvim",
  config = function(plugin, opts)
    -- Add bindings which show up as group name
    local wk = require "which-key"
    wk.register {
      ["<leader>a"] = {
        name = "ChatGPT",
        c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
        e = { "<cmd>ChatGPTEditWithInstruction<CR>", "ChatGPT Edit with instruction", mode = { "n", "v" } },
        g = { "<cmd>ChatGPTRun grammar_correction<CR>", "ChatGPT Grammar Correction", mode = { "n", "v" } },
        tz = { "<cmd>ChatGPTRun translate chiness<CR>", "ChatGPT Translate to chiness", mode = { "n", "v" } },
        te = { "<cmd>ChatGPTRun translate english<CR>", "ChatGPT Translate to english", mode = { "n", "v" } },
        k = { "<cmd>ChatGPTRun keywords<CR>", "ChatGPT Keywords", mode = { "n", "v" } },
        d = { "<cmd>ChatGPTRun docstring<CR>", "ChatGPT Docstring", mode = { "n", "v" } },
        a = { "<cmd>ChatGPTRun add_tests<CR>", "ChatGPT Add Tests", mode = { "n", "v" } },
        o = { "<cmd>ChatGPTRun optimize_code<CR>", "ChatGPT Optimize Code", mode = { "n", "v" } },
        s = { "<cmd>ChatGPTRun summarize<CR>", "ChatGPT Summarize", mode = { "n", "v" } },
        f = { "<cmd>ChatGPTRun fix_bugs<CR>", "ChatGPT Fix Bugs", mode = { "n", "v" } },
        x = { "<cmd>ChatGPTRun explain_code<CR>", "ChatGPT Explain Code", mode = { "n", "v" } },
        r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "ChatGPT Roxygen Edit", mode = { "n", "v" } },
        l = {
          "<cmd>ChatGPTRun code_readability_analysis<CR>",
          "ChatGPT Code Readability Analysis",
          mode = { "n", "v" },
        },
      },
      ["<leader>r"] = {
        name = "rest http client",
        h = { "<Plug>RestNvim", "run rest http clent" },
        c = { "<Plug>RestNvimPreview", "show rest curl" },
      },
      ["<leader>lt"] = {
        name = "lsp test",
        r = { ':lua require("neotest").run.run()<CR>', "run test", mode = { "n", "v" } },
        d = { ':lua require("neotest").run.run({strategy = "dap"})<CR>', "run test dap", mode = { "n", "v" } },
        o = {
          ':lua require("neotest").output.open({ enter = true,auto_close=true })<CR>',
          "show test output",
          mode = { "n", "v" },
        },
        lo = {
          ':lua require("neotest").output.open({ enter = true,last_run=true,auto_close=true})<CR>',
          "show last test output",
          mode = { "n", "v" },
        },
        lr = { ':lua require("neotest").run.run_last()', "run last test", mode = { "n", "v" } },
        ld = {
          ':lua require("neotest").run.run_last({strategy = "dap"})<CR>',
          "run last test dap",
          mode = { "n", "v" },
        },
        p = { ':lua require("neotest").output_panel.toggle()<CR>', "show test output-anel", mode = { "n", "v" } },
        y = { ':lua require("neotest").summary.toggle()<CR>', "show test summary", mode = { "n", "v" } },
        s = { ':lua require("neotest").run.stop()<CR>', "stop test", mode = { "n", "v" } },
        a = { ':lua require("neotest").run.attach()<CR>', "attach test", mode = { "n", "v" } },
      },
      ["<leader>d"] = {
        K = {
          ':lua require("dapui").float_element("scopes", {width=80,height=40,enter=true,position=true})<CR>',
          "debug float",
          mode = { "n", "v" },
        },
      },
    }
  end,
}
