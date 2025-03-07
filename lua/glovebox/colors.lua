local util = require("glovebox.util")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("glovebox.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  colors = {
    none = "NONE",
    bg_dark = "#1d2021",
    bg = "#1d2021",
    bg_highlight = "#282828",
    terminal_black = "#414868",
    fg = "#ebdbb2",
    fg_dark = "#ebdbb2",
    fg_gutter = "#a89984",
    dark3 = "#545c7e",
    comment = "#928374",
    dark5 = "#504945",
    visual = "#3f3f3f",
    blue0 = "#7aa2f7",
    blue = "#7aa2f7",
    cyan = "#7dcfff",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8",
    blue7 = "#394b70",
    magenta = "#83a598",
    magenta2 = "#ff007c",
    purple = "#d3869b",
    orange = "#fe8019",
    redorange = "#fb4934",
    yellow = "#fabd2f",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    vomitgreen = "#b8bb26",
    teal = "#1abc9c",
    red = "#fb4b4b",
    red1 = "#f7768e",
    git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
    gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
  }
  if config.style == "night" or config.style == "day" or vim.o.background == "light" then
    colors.bg = "#1a1b26"
    colors.bg_dark = "#16161e"
  end
  util.bg = colors.bg
  util.day_brightness = config.dayBrightness

  colors.diff = {
    add = util.darken(colors.green2, 0.15),
    delete = util.darken(colors.red1, 0.15),
    change = util.darken(colors.blue7, 0.15),
    text = colors.blue7,
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.fg_gutter
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_highlight

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = (config.transparentSidebar and colors.none) or config.darkSidebar and colors.bg_dark or colors.bg
  colors.bg_float = config.darkFloat and colors.bg_dark or colors.bg

  colors.bg_visual = util.darken(colors.visual, 0.7)
  colors.bg_search = colors.visual
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red
  colors.warning = colors.yellow
  colors.info = colors.blue2
  colors.hint = colors.teal

  util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(colors)
  end

  return colors
end

return M
