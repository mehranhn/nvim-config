return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    priority = 1000,
    config = function ()
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("f", "󰈞  Find file", "<CMD>Telescope find_files<CR>"),
            dashboard.button("k", "  New file", "<CMD>ene <BAR> startinsert<CR>"),
            -- dashboard.button("p", "  Find project", "<CMD>Telescope projects<CR>"),
            dashboard.button("p", "  Find project", "<CMD>lua require'telescope'.extensions.project.project{}<CR>"),
            dashboard.button("r", "󰄉  Recently used files", "<CMD>Telescope oldfiles<CR>"),
            dashboard.button("t", "󰗴  Find text", "<CMD>Telescope live_grep<CR>"),
            dashboard.button("c", "  Configuration", "<CMD>e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("q", "󰅚  Quit Neovim", "<CMD>qa<CR>"),
        }

        local function footer()
            return "MHN"
        end

        dashboard.section.footer.val = footer()

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        require('alpha').setup(dashboard.opts)
    end
};
