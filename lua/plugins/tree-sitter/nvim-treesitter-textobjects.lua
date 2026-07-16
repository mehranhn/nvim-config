local status_ok, ntt = pcall(require, "nvim-treesitter-textobjects");
if not status_ok then
    return;
end

ntt.setup({})
