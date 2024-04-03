-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local get_hlgroup = require("astroui").get_hlgroup -- get highlights from highlight groups
local normal = get_hlgroup "Normal"
local bg = normal.bg
---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "catppuccin",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },

        -- flash
        FlashMatch = { bg = bg, fg = "#89b4fa", bold = true, italic = true },
        FlashCurrent = { bg = bg, fg = "#04a5e5", bold = true, italic = true, underline = true },
        FlashLabel = { bg = bg, fg = "#ff007c", bold = true },
        FlashBackdrop = { bg = bg, fg = "#6c7086" },
        -- 自定义的注释颜色
        comment = { bg = bg, fg = "#6c7086" },
        -- LineNr={ bg = bg, fg = "#e1eaff" }
        ColorColumn = { bg = "#39434e" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
