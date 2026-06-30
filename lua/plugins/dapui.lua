return {
    "rcarriga/nvim-dap-ui",
    enabled = false,
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    opts = {
        mappings = {
            -- Use a table to apply multiple mappings
            expand = { "o", "<2-LeftMouse>" },
            open = "<CR>",
            remove = "d",
            edit = "s",
            repl = "r",
        },
    },
    config = function(_, opts)
        local dapui = require("dapui");
        local dap = require("dap");

        dapui.setup(opts);

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        local status_ok, wk = pcall(require, "which-key")
        if not status_ok then
            return
        end

        wk.add({
            { "<leader>dt", function() dapui.toggle() end, desc = "Toggle Dap UI" },
        });
    end,
}
