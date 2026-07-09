local status_ok, dapui = pcall(require, "dapui");
if status_ok then
    dapui.setup({
        mappings = {
            -- Use a table to apply multiple mappings
            expand = { "o", "<2-LeftMouse>" },
            open = "<CR>",
            remove = "d",
            edit = "s",
            repl = "r",
        },
    });

    vim.keymap.set("n", "<leader>dt", function() dapui.toggle() end, { desc = "Toggle Dap UI" });

    local status_ok_dap, dap = pcall(require, "dap")
    if status_ok_dap then
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
end

