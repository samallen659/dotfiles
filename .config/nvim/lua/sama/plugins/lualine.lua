local setup, lualine = pcall(require, "lualine")
if not setup then
  return
end

local lualine_moonfly = require("lualine.themes.moonfly")

lualine.setup({
  options = {
    theme = lualine_moonfly
  }
})
