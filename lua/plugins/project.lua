local status_ok, project = pcall(require, "project");
if not status_ok then
    return;
end

project.setup();
