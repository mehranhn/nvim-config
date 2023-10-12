local kind_icons = {
    Text = "󰊄",
    Method = "m",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
};

return {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    "saadparwaiz1/cmp_luasnip",
    "b0o/schemastore.nvim",
    {
        "saecki/crates.nvim",
        tag = 'v0.1.0',
        event = { "BufRead Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "hrsh7th/nvim-cmp",
        init = function()
            require("luasnip/loaders/from_vscode").lazy_load()
            vim.g.completeopt="menu,menuone,noselect,noinsert"
        end,
        dependencies = {
            "lukas-reineke/cmp-under-comparator",
        },
        config = function()
            local cmp = require("cmp");
            local luasnip = require("luasnip");

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-e>"] = {
                        i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    },
                    ["<C-n>"] = {
                        i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    },
                    ["<C-k>"] = {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    },
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    -- ["<Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_next_item()
                    --     elseif luasnip.expandable() then
                    --         luasnip.expand()
                    --     elseif luasnip.expand_or_jumpable() then
                    --         luasnip.expand_or_jump()
                    --     elseif check_backspace() then
                    --         fallback()
                    --     else
                    --         fallback()
                    --     end
                    -- end, {
                    --     "i",
                    --     "s",
                    -- }),
                    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_prev_item()
                    --     elseif luasnip.jumpable(-1) then
                    --         luasnip.jump(-1)
                    --     else
                    --         fallback()
                    --     end
                    -- end, {
                    --     "i",
                    --     "s",
                    -- }),
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        -- Kind icons
                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                        vim_item.menu = ({
                            nvim_lua = "[Lua]",
                            crates = "[Crates]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            npm = "[NPM]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                sources = {
                    { name = "nvim_lua" },
                    -- { name = "crates" }, -- lazy loaded
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    -- { name = 'npm', keyword_length = 4 },
                    { name = "buffer", Keyword_length = 5 },
                    { name = "path" },
                },
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        require "cmp-under-comparator".under,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                window = {
                    documentation = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    },
                },
                experimental = {
                    ghost_text = true,
                    native_menu = false,
                },
            });
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline({
                    ["<C-e>"] = {
                        i = cmp.mapping.select_prev_item(),
                        c = cmp.mapping.select_prev_item(),
                    },
                }),
                sources = {
                    { name = 'buffer' },
                },
            });
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline({
                    ["<C-e>"] = {
                        i = cmp.mapping.select_prev_item(),
                        c = cmp.mapping.select_prev_item(),
                    },
                }),
                sources = {
                    { name = 'path' },
                    { name = 'cmdline' },
                },
            });
        end
    },
}
