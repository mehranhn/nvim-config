local status_ok, rust = pcall(require, "rust-tools")
if not status_ok then
  return
end

rust.setup({
  server = {
    -- standalone file support
    -- setting it to false may improve startup time
    standalone = false,
    settings = {
      ["rust-analyzer"] = {
        experimental = {
          procAttrMacros = false,
        },
        -- procMacro = {
        --   enable = true,
        --   ignored = {
        --     async_trait = {
        --       "async_trait",
        --     },
        --   },
        -- },
      },
    },
  },
})
