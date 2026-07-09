local status_ok, cmp = pcall(require, "blink.cmp");
if not status_ok then
    return;
end

cmp.build():pwait()

cmp.setup({
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
        preset = "enter",
        ["<C-l>"] = { "hide" },
        ["<C-e>"] = { "select_prev" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
    },

    cmdline = {
        keymap = {
            preset = "cmdline",
            ["<C-l>"] = { "hide" },
            ["<C-e>"] = { "select_prev" },
            ["<C-n>"] = { "select_next" },
            -- ["<Tab>"] = { "select_next" },
            -- ["<S-Tab>"] = { "select_prev" },
        },
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
        documentation = { auto_show = false },
        ghost_text = { enabled = true },
    },

    -- (Default) list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = { default = { "lsp", "path", "buffer" } },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"`
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "rust" },
})
