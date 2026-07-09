local status_ok, tsm = pcall(require, "tree-sitter-manager");
if not status_ok then
    return;
end

tsm.setup({
  -- Default Options
  -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session. If set to "all", install all parsers.
  ensure_installed = { "angular", "arduino", "asm", "bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "cuda", "dart", "desktop", "diff", "disassembly", "dockerfile", "ecma", "editorconfig", "fish", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "glsl", "go", "gomod", "gosum", "gpg", "haskell", "hlsl", "html", "html_tags", "http", "hurl", "hyprlang", "ini", "java", "javascript", "jq", "jsdoc", "json", "json5", "jsx", "kotlin", "latex", "llvm", "lua", "luadoc", "luau", "make", "markdown", "markdown_inline", "meson", "nginx", "ninja", "odin", "passwd", "powershell", "printf", "prisma", "proto", "python", "r", "regex", "ron", "rust", "scss", "slint", "solidity", "sql", "ssh_config", "svelte", "sway", "swift", "tmux", "toml", "tsv", "tsx", "typescript", "udev", "vala", "vim", "vimdoc", "vue", "wgsl", "wgsl_bevy", "yaml", "yuck", "zathurarc", "zig", "ziggy", "ziggy_schema", "zsh" },
  -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
  -- auto_install = false, -- if enabled, install missing parsers when editing a new file
  -- highlight = true, -- treesitter highlighting is enabled by default
  -- languages = {}, -- override or add new parser sources
});
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = { "rust", "typescript" },
--     callback = function(args)
--         vim.treesitter.start(args.buf)
--         vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--         vim.wo.foldmethod = 'expr'
--         vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--     end,
-- });
