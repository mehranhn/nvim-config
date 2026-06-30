return {
    {"theHamsta/nvim-dap-virtual-text", enabled = false},
    {"leoluz/nvim-dap-go", enabled = false, opts = {}},
    {
        "mfussenegger/nvim-dap",
        enabled = false,
        init = function()
            vim.fn.sign_define('DapBreakpoint', {text='', texthl='ErrorMsg', linehl='', numhl=''})
            vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "ErrorMsg", linehl = "", numhl = "" })
            vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='WarningMsg', linehl='', numhl=''})
            vim.fn.sign_define('DapLogPoint', {text='𥉉', texthl='Title', linehl='', numhl=''})
            vim.fn.sign_define('DapStopped', {text='', texthl='Title', linehl='Visual', numhl=''})
        end,
        config = function()
            local dap = require("dap");
            dap.adapters.lldb = {
                type = "executable",
                command = "/usr/bin/lldb-vscode", -- adjust as needed
                name = "lldb"
            };

            -- pip install debugpy
            -- dap.adapters.python = {
            --   type = 'executable';
            --   command = 'python';
            --   args = { '-m', 'debugpy.adapter' };
            -- }

            -- dap.adapters.node2 = {
            --   type = 'executable',
            --   command = 'node',
            --   args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
            -- }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/debug", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},

                    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                    --
                    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                    --
                    -- Otherwise you might get the following error:
                    --
                    --    Error on launch: Failed to attach to the target process
                    --
                    -- But you should be aware of the implications:
                    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
                    runInTerminal = false,
                },
            }

            -- If you want to use this for rust and c, add something like this:
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            -- dap.configurations.python = {
            --     {
            --         -- The first three options are required by nvim-dap
            --         type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
            --         request = 'launch';
            --         name = "Launch file";
            --
            --         -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
            --
            --         program = "${file}"; -- This configuration will launch the current file if used.
            --         pythonPath = function()
            --             -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            --             -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            --             -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            --             local cwd = vim.fn.getcwd()
            --             if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            --                 return cwd .. '/venv/bin/python'
            --             elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            --                 return cwd .. '/.venv/bin/python'
            --             else
            --                 return '/usr/bin/python'
            --             end
            --         end;
            --     },
            -- }

            -- dap.configurations.javascript = {
            --     {
            --         name = 'Launch',
            --         type = 'node2',
            --         request = 'launch',
            --         program = '${file}',
            --         cwd = vim.fn.getcwd(),
            --         sourceMaps = true,
            --         protocol = 'inspector',
            --         console = 'integratedTerminal',
            --     },
            --     {
            --         -- For this to work you need to make sure the node process is started with the `--inspect` flag.
            --         name = 'Attach to process',
            --         type = 'node2',
            --         request = 'attach',
            --         processId = require'dap.utils'.pick_process,
            --     },
            -- }

            local status_ok, wk = pcall(require, "which-key")
            if not status_ok then
                return
            end

            wk.add({
                { "<leader>d", group = "Debug" },
                { "<leader>dh", function() dap.step_out() end, desc = "Step Out" },
                { "<leader>dn", function() dap.step_over() end, desc = "Step Over" },
                { "<leader>de", function() dap.step_back() end, desc = "Step Back" },
                { "<leader>di", function() dap.step_into() end, desc = "Step Into" },
                { "<leader>do", function() dap.continue() end, desc = "Continue" },
                { "<leader>dO", function() dap.reverse_continue() end, desc = "Reverse Continue" },
                { "<leader>du", function() dap.run_to_cursor() end, desc = "Run To Cursor" },
                { "<leader>dd", function() dap.toggle_breakpoint() end, desc = "Toggle Breakpoint" },
                { "<leader>dp", function() dap.pause() end, desc = "Pause" },
                { "<leader>dR", function() dap.run_last() end, desc = "Run Last" },
                { "<leader>dr", function() dap.repl.open() end, desc = "Open Repel" },
                { "<leader>dq", function() dap.close() end, desc = "Quit" },
                { "<leader>dl", function() dap.set_breakpoint(nil, nil, vim.fn.input("log pint message: ")) end, desc = "Set Break Point" },
            });
        end,
    },
}
