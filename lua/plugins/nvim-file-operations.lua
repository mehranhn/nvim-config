local status_ok, nfp = pcall(require, "nvim-file-operations");
if not status_ok then
    return;
end

nfp.setup();
