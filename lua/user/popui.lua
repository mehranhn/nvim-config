local status_ok, popui = pcall(require, "popui")
if not status_ok then
  return
end

vim.ui.select = require"popui.ui-overrider"
vim.g.popui_border_style = "rounded"
