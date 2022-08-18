local config = require("glovebox.config")
local colors = require("glovebox.colors").setup(config)
local util = require("glovebox.util")

local glovebox = {}

glovebox.normal = {
  left = {{ colors.black, colors.blue }, { colors.blue, colors.fg_gutter }},
  middle = {{ colors.fg, colors.bg_statusline }},
  right = {{ colors.black, colors.blue }, { colors.blue, colors.fg_gutter }},
  error = {{ colors.black, colors.error }},
  warning = {{ colors.black, colors.warning }},
}

glovebox.insert = {
  left = {{ colors.black, colors.green }, { colors.blue, colors.bg }},
}

glovebox.visual = {
  left = {{ colors.black, colors.magenta }, { colors.blue, colors.bg }},
}

glovebox.replace = {
  left = {{ colors.black, colors.red }, { colors.blue, colors.bg }},
}

glovebox.inactive = {
  left = {{ colors.blue, colors.bg_statusline }, {colors.dark3, colors.bg }},
  middle = {{ colors.fg_gutter, colors.bg_statusline }},
  right = {{ colors.fg_gutter, colors.bg_statusline }, {colors.dark3, colors.bg }},
}

glovebox.tabline = {
  left = {{ colors.dark3, colors.bg_highlight }, {colors.dark3, colors.bg }},
  middle = {{ colors.fg_gutter, colors.bg_statusline }},
  right = {{ colors.fg_gutter, colors.bg_statusline }, {colors.dark3, colors.bg }},
  tabsel = {{ colors.blue, colors.fg_gutter }, { colors.dark3, colors.bg }},
}

if vim.o.background == "light" then
  for _, mode in pairs(glovebox) do
    for _, section in pairs(mode) do
      for _, subsection in pairs(section) do
        subsection[1] = util.getColor(subsection[1])
        subsection[2] = util.getColor(subsection[2])
      end
    end
  end
end

return glovebox
