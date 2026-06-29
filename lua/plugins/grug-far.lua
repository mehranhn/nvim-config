return {
    "MagicDuck/grug-far.nvim",
    config = function()
        local grug = require("grug-far")

        grug.setup({
            keymaps = {
                replace = { n = "<localleader>r" },
                qflist = { n = "<localleader>c" },
                syncLocations = { n = "<localleader>s" },
                syncLine = { n = "<localleader>l" },
                close = { n = "<localleader>q" },
                historyOpen = { n = "<localleader>t" },
                historyAdd = { n = "<localleader>a" },
                refresh = { n = "<localleader>f" },
                openLocation = { n = "<localleader>o" },
                openNextLocation = { n = "<down>" },
                openPrevLocation = { n = "<up>" },
                gotoLocation = { n = "<enter>" },
                pickHistoryEntry = { n = "<enter>" },
                abort = { n = "<localleader>b" },
                help = { n = "g?" },
                toggleShowCommand = { n = "<localleader>w" },
                swapEngine = { n = "<localleader>p" },
                previewLocation = { n = "<localleader>i" },
                swapReplacementInterpreter = { n = "<localleader>x" },
                applyNext = { n = "<localleader>n" },
                applyPrev = { n = "<localleader>e" },
                syncNext = { n = "<localleader>," },
                syncPrev = { n = "<localleader>." },
                syncFile = { n = "<localleader>v" },
                nextInput = { n = "<tab>" },
                prevInput = { n = "<s-tab>" },
            },
        })

        vim.keymap.set({ "n", "x" }, "<leader>rr", function()
            require("grug-far").open({ prefills = { paths = vim.fn.expand("%") }, visualSelectionUsage = "auto-detect" })
        end, { desc = "grug-far: Replace Current File" })

        vim.keymap.set({ "n", "x" }, "<leader>rs", function()
            require("grug-far").open()
        end, { desc = "grug-far: Resplase Current Workspace" })
    end,
}
