local status_ok, rust = pcall(require, "rust-tools")
if not status_ok then
  return
end

rust.setup()
