local status_ok, image = pcall(require, "image");
if not status_ok then
    return;
end

image.setup({
    backend = "sixel",
    processor = "magick_cli",
});
