-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
vim.cmd "au BufNewFile,BufRead *.http :setl ft=http"

vim.cmd "autocmd FileType * lua setKeybinds()"
function setKeybinds()
  local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
  local opts = { prefix = "<localleader>", buffer = 0 }
  -- include the default astronvim config that calls the setup call
  -- Add bindings which show up as group name
  local wk = require "which-key"
  if fileTy == "markdown" then
    wk.register {
      ["<leader>m"] = {
        name = "markdown",
        p = { ":MarkdownPreview<CR>", "markdown preview", mode = { "n" } },
      },
    }
  elseif fileTy == "java" then
    -- 目前neotest-java 不能支持dap,采用jdtls默认的dap 执行test
    wk.register {
      ["<leader>ltd"] = {
        require("jdtls").test_nearest_method,
        "run test dap",
      },
      ["<leader>ltld"] = {
        require("jdtls").test_nearest_method,
        "run test dap",
      },
    }
  elseif fileTy == "toml" then
    wk.register {
      ["g"] = {
        Sf = { ':lua require("crates").show_features_popup()<cr>', "crates show_features_popup", mode = { "n" } },
        Sd = {
          ':lua require("crates").show_dependencies_popup()<cr>',
          "crates show_dependencies_popup",
          mode = { "n" },
        },
        Xh = { ':lua require("crates").open_homepage()<cr>', "crates open_homepage", mode = { "n" } },
        Xr = { ':lua require("crates").open_repository()<cr>', "crates open_repository", mode = { "n" } },
        Xd = { ':lua require("crates").open_documentation()<cr>', "crates open_documentation", mode = { "n" } },
        Xc = { ':lua require("crates").open_crates_io()<cr>', "crates open_crates_io", mode = { "n" } },
      },
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
