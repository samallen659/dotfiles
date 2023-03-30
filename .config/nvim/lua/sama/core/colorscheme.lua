vim.cmd("colorscheme moonfly")

local status, _ = pcall(vim.cmd, "colorscheme moonfly")
if not status then
  print("colorsheme not found")
  return
end
