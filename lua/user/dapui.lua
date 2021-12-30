local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
  return
end

dapui.setup {
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "o", "<2-LeftMouse>" },
    open = "<CR>",
    remove = "d",
    edit = "s",
    repl = "r",
  },
}

local dstatus_ok, dap = pcall(require, "dap")
if not dstatus_ok then
  return
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
