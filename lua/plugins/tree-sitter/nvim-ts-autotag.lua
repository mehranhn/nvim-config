local status_ok, nta = pcall(require, "nvim-ts-autotag");
if not status_ok then
    return;
end

nta.setup();
