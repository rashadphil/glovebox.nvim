local config = require("glovebox.config")
local colors = require("glovebox.colors").setup(config)
local util = require("glovebox.util")

local glovebox = {}

glovebox.normal = {
  a = { bg = colors.fg_gutter, fg = colors.black },
  b = { bg = colors.dark5, fg = colors.fg },
  c = { bg = colors.dark5, fg = colors.fg },
}

glovebox.insert = {
  a = { bg = colors.vomitgreen, fg = colors.black },
  b = { bg = colors.dark5, fg = colors.vomitgreen },
}

glovebox.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.dark5, fg = colors.yellow },
}

glovebox.visual = {
  a = { bg = colors.magenta, fg = colors.black },
  b = { bg = colors.dark5, fg = colors.magenta },
}

glovebox.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.dark5, fg = colors.red },
}

glovebox.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.bg_statusline, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.bg_statusline },
}

if vim.o.background == "light" then
  for _, mode in pairs(glovebox) do
    for _, section in pairs(mode) do
      if section.bg then
        section.bg = util.getColor(section.bg)
      end
      if section.fg then
        section.fg = util.getColor(section.fg)
      end
    end
  end
end

if vim.g.glovebox_lualine_bold then
  for _, mode in pairs(glovebox) do
    mode.a.gui = "bold"
  end
end

return glovebox
