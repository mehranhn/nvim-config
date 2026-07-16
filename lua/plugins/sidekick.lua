local status_ok, sidekick = pcall(require, "sidekick")
if not status_ok then
    return
end

sidekick.setup({
    nes = { enabled = false },
    cli = {
        mux = {
            backend = "zellij",
            enabled = true
        },
        tools = {
            antigravity = {
                cmd = { "/bin/sh", "-c", "ALL_PROXY='http://127.0.0.1:10601' HTTP_PROXY='http://127.0.0.1:10601' HTTPS_PROXY='http://127.0.0.1:10601' agy" },
            },
        },
    },
})

vim.keymap.set({ "n", "t", "i", "x" }, "<c-.>", function() require("sidekick.cli").focus() end, { desc = "Sidekick Toggle CLI" })
vim.keymap.set("n", "<leader>ii", function() require("sidekick.cli").toggle({ name = "antigravity", focus = true }) end, { desc = "Sidekick Toggle CLI" })
vim.keymap.set("n", "<leader>is", function() require("sidekick.cli").select({ filter = { installed = true } }) end, { desc = "Select CLI" })
vim.keymap.set("n", "<leader>id", function() require("sidekick.cli").close() end, { desc = "Detach a CLI Session" })
vim.keymap.set({ "n", "x" }, "<leader>it", function() require("sidekick.cli").send({ msg = "{this}" }) end, { desc = "Send This" })
vim.keymap.set("n", "<leader>if", function() require("sidekick.cli").send({ msg = "{file}" }) end, { desc = "Send File" })
vim.keymap.set("x", "<leader>iv", function() require("sidekick.cli").send({ msg = "{selection}" }) end, { desc = "Send Visual Selection" })
vim.keymap.set({ "n", "x" }, "<leader>ip", function() require("sidekick.cli").prompt() end, { desc = "Sidekick Select Prompt" })

