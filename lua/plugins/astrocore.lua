-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

vim.cmd "autocmd FileType * lua setKeybinds()"
function setKeybinds()
  local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
  local opts = { prefix = "<localleader>", buffer = 0 }
  -- include the default astronvim config that calls the setup call
  -- Add bindings which show up as group name
  local wk = require "which-key"

  if fileTy == "markdown" then
    wk.add {
      { "<leader>m", group = "markdown" },
      { "<leader>mp", ":MarkdownPreview<CR>", desc = "markdown preview", mode = { "n" } },
    }
  elseif fileTy == "java" then
    -- 目前neotest-java 不能支持dap,采用jdtls默认的dap 执行test
    wk.add {
      { "<leader>ltd", require("jdtls.dap").test_nearest_method, desc = "run test dap" },
      { "<leader>ltld", require("jdtls.dap").test_nearest_method, desc = "run test dap" },
    }
  elseif fileTy == "toml" then
    wk.add {
      {
        "gSf",
        ':lua require("crates").show_features_popup()<cr>',
        desc = "crates show_features_popup",
        mode = { "n" },
      },
      {
        "gSd",
        ':lua require("crates").show_dependencies_popup()<cr>',
        desc = "crates show_dependencies_popup",
        mode = { "n" },
      },
      { "gXh", ':lua require("crates").open_homepage()<cr>', desc = "crates open_homepage", mode = { "n" } },
      { "gXr", ':lua require("crates").open_repository()<cr>', desc = "crates open_repository", mode = { "n" } },
      { "gXd", ':lua require("crates").open_documentation()<cr>', desc = "crates open_documentation", mode = { "n" } },
      { "gXc", ':lua require("crates").open_crates_io()<cr>', desc = "crates open_crates_io", mode = { "n" } },
    }
  elseif fileTy == "sh" then
  end
end
-- 以下操作对目录下的 md 文件进行文本替换并直接写入源文件，查看 diff，然后撤销写入。
-- nvim -u NONE --headless\
--  +"
--   :args *.md
--   :args
--   :silent! argdo %s/a/.../ge | update"\
--  +"
--   :!git diff
--   :silent! argdo undo | update"\
--  +":qa"
--
-- telescope 中tab 选中结果,alt q 选择选择结果,ctrl q 全部结果,发送到quick fix
-- cdo vs ldo：全局操作 vs 局部（当前 buffer）操作
-- cdo vs cfdo：全部操作 vs 对每个文件只操作一次
-- silent! noautocmd cdo ... | update
--
-- gi  - 返回上一次插入文本的地方。
-- g;  - 返回上一个修改位置
-- g,  - 返回下一个修改位置
-- '. - 跳转到最后一次修改的地方(.代表最后一次修改的地方)
-- '" - 上一次编辑文件的地方
-- '' - 跳转到上次跳转之前的位置
-- '^ - 跳转到上次 insert mode 停止的地方
-- '( - 当前句子的开头
-- ') - 当前句子的结尾
-- '{ - 当前段落的开头
-- '} - 当前段落的结尾
-- '[ - 上一次修改或复制的第一行的第一个字符
-- '] - 上一次修改或复制的最后一行的最后一个字符
-- '< - 上一次Visual area的开始位置
-- '> - 上一次Visual area的结束位置
--
function toggle_telescope()
  local harpoon = require "harpoon"
  local conf = require("telescope.config").values
  local harpoon_files = harpoon:list()
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end
  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        -- set to true or false etc.
        wrap = true, -- sets vim.opt.wrap 换行显示多于部分
        smartcase = true, --sets vim.opt.smartcase
        ignorecase = true, --sets vim.opt.ignorecase
        breakindent = true, --sets vim.opt.breakindent tab虚线
        expandtab = true, --sets vim.opt.expandtab tab转空格
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        mapleader = " ", -- sets vim.g.mapleader
        maplocalleader = " ",
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        resession_enabled = true, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)

        transparent_background = true,
        undotree_WindowLayout = 3,
        undotree_ShortIndicators = 0,
        undotree_SplitWidth = 30,
        undotree_DiffpanelHeight = 10,
        undotree_DiffAutoOpen = 1,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        ["<leader>cd"] = { ":silent  cd %:h<CR>", desc = "cd %:h" },
        ["<A-j>"] = { ":m .+1<CR>==" },
        ["<A-k>"] = { ":m .-2<CR>==" },
        ["<A-Enter>"] = { ":WindowsMaximize<CR>", desc = "windowMaxSize" },
        ["<leader><leader>"] = { ":WindowsEqualize<CR>", desc = "windowEqualize" },
        ["<leader>tr"] = {
          ":Pantran<CR>",
          desc = "translate",
        },

        ["<leader>gw"] = {
          ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
          desc = "telescope-live-grep-args",
        },
        ["<leader>D"] = {
          ":DBUIToggle<CR>",
          desc = "open DBUI",
        },
        ["<leader>fd"] = {
          ":Telescope todo-comments<CR>",
          desc = "telescope todo-comments",
        },
        ["<leader>ap"] = {
          function()
            local harpoon = require "harpoon"
            harpoon:list():append()
          end,
          desc = "harpoon2 add",
        },
        ["<leader>rp"] = {
          function() require("harpoon"):list():remove() end,
          desc = "harpoon2 mark rm",
        },
        ["<leader>fp"] = { function() toggle_telescope() end, desc = "telescope harpoon2" },
        -- trouble
        ["<leader>xx"] = { "<cmd>Trouble diagnostics toggle<cr>", noremap = true, silent = true },
        ["gDo"] = { ":DiffviewOpen ", desc = "DiffViewOpen", noremap = true, silent = true },
        ["gDh"] = { ":DiffviewFileHistory ", desc = "DiffviewFileHistory", noremap = true, silent = true },
        ["gDq"] = { ":DiffviewClose<CR>", desc = "DiffviewClose", noremap = true, silent = true },
        ["ga"] = {
          "<Plug>(EasyAlign)",
          desc = "EasyAlign",
        },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      v = {
        --  mapmode-v 仅在视觉和选择模式下激活
        ["<A-k>"] = { ":m '<-2<CR>gv=gv" },
        ["<A-j>"] = { ":m '>+1<CR>gv=gv" },
      },
      s = {
        --  mapmode-x 仅在选择模式下激活
      },
      x = {
        --  mapmode-x 仅在视觉模式下激活
        ["<leader>tr"] = {
          ":Pantran<CR>",
          desc = "translate",
        },
        ["ga"] = {
          "<Plug>(EasyAlign)",
          desc = "EasyAlign",
        },
      },
      i = {
        ["<A-j>"] = { "<Esc>ja" },
        ["<A-k>"] = { "<Esc>ka" },
        ["<A-h>"] = { "<Esc>i" },
        ["<A-l>"] = { "<Esc>la" },
      },
      c = {},
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
