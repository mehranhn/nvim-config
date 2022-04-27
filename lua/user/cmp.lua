local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local npm_status_ok, npm = pcall(require, "cmp-npm")
if npm_status_ok then
    npm.setup()
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet
vim.g.completeopt="menu,menuone,noselect,noinsert"

cmp.setup {
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
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline({
        ["<C-e>"] = {
            i = cmp.mapping.select_prev_item(),
            c = cmp.mapping.select_prev_item(),
        },
    }),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        ["<C-e>"] = {
            i = cmp.mapping.select_prev_item(),
            c = cmp.mapping.select_prev_item(),
        },
    }),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
