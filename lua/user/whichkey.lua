local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "n", "e" },
        v = { "n", "e" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    A = { "<cmd>Alpha<cr>", "Alpha" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    w = { "<cmd>w!<CR>", "Save" },
    q = { "<cmd>q!<CR>", "Quit" },
    h = { "<cmd>nohlsearch<CR>", "No Highlight" },

    c = {
        name = "Buffers/Tabs",
        b = {
            "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
            "Buffers",
        },
        c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
        a = { "<cmd>bufdo Bdelete<CR>", "Close All Buffers" },
        v = { "<cmd>vsplit<CR>", "Split Vertically" },
        x = { "<cmd>split<CR>", "Split Horizontally" },
        t = { "<cmd>tabnew<CR>", "New Tab" },
        n = { "<cmd>tabnext<CR>", "Next Tab" },
        e = { "<cmd>tabprevious<CR>", "Previous Tab" },
        d = { "<cmd>tabclose<CR>", "Close Tab" },
    },

    d = {
        name = "Debug",
        h = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
        n = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        e = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        O = { "<cmd>lua require'dap'.reverse_continue()<cr>", "Reverse Continue" },
        u = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
        d = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
        R = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
        r = { "<cmd>lua require'dap'.repl.open()<cr>", "Open Repel" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
        l = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input(\"Log point message: \"))<cr>", "Set Log Point" },
        t = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle Dap UI" },
    },
    i = {
        name = "Harpoon",
        i = { "<cmd>lua require('harpoon.mark').toggle_file()<cr>", "Toggle File" },
        n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next" },
        e = { "<cmd>lua require('harpoon.ui').nav_prev()  <cr>", "Previous" },
        M = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Menu" },
        m = { "<cmd>Telescope harpoon marks<cr>", "Menu (Telescope)" },
    },

    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        C = { "<cmd>PackerClean<cr>", "Clean" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    g = {
        name = "Git",
        n = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        e = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        D = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Diff",
        },
    },

    l = {
        name = "Trouble",
        w = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics", },
        W = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics", },
        A = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
        r = { "<cmd>TroubleToggle lsp_references<CR>", "References"},
        i = { "<cmd>TroubleToggle lsp_implementations<CR>", "Implementations"},
        a = { "<cmd>TroubleToggle loclist<cr>", "Code Action" },
        d = { "<cmd>TroubleToggle lsp_definitions<CR>", "Definition"},
        D = { "<cmd>TroubleToggle lsp_type_definitions<CR>", "Type Definition"},
    },

    n = {
        name = "LSP",
        w = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics", },
        W = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics", },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        I = { "<cmd>LspInfo<cr>", "Info" },
        n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
        e = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
        o = { "<cmd>SymbolsOutline<cr>", "Outline" },
        A = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
        H = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"},
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
        d = { "<cmd>Telescope lsp_definitions<CR>", "Definition"},
        i = { "<cmd>Telescope lsp_implementations<CR>", "Implementations"},
        r = { "<cmd>Telescope lsp_references<CR>", "References"},
        a = { "<cmd>Telescope lsp_code_actions<cr>", "Code Action" },
        Q = { "<cmd>LspRestart<cr>", "Restart" },
        j = { "<cmd>LspStart<cr>", "Start" },
        J = { "<cmd>LspStop<cr>", "Stop" },
        l = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = \"rounded\" })<cr>", "Line Diagnostics" },
    },
    s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        m = { "<cmd>lua require('telescope').extensions.media_files.media_files()<CR>", "Media Files" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        e = { "<cmd>Telescope emoji<cr>", "Emoji" },
        -- p = { "<cmd>Telescope projects<cr>", "Projects" },
        p = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        i = { "<cmd>Telescope harpoon marks<cr>", "Harpoon Marks" },
        s = {
            "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
            "Find files",
        },
        S = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    },

    r = {
        name = "Replace",
        r = { "<Plug>(Scalpel)", "Replace Word Current File (Scalpel)"},
        R = { "<CMD>lua require('spectre').open_file_search()<CR>", "Replace Current File"},
        s = { "<CMD>lua require('spectre').open()<CR>", "Replace Workspace"},
        S = { "<CMD>lua require('spectre').open_visual()<CR>", "Replace Workspace (Visual)"},
        w = { "<CMD>lua require('spectre').open_visual({select_word=true})<CR>", "Replace Workspace (Word)"},
        t = { "<CMD>ISwap<CR>", "ISwap"},
    },

    t = {
        name = "Terminal",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        -- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        d = { "<cmd>lua _LAZYDOCKER_TOGGLE()<cr>", "Lazydocker" },
        h = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        -- p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        t = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        x = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
