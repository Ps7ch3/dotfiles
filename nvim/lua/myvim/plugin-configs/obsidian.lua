local obsidian_status_ok, obsidian = pcall(require, "obsidian")
if not obsidian_status_ok then
    return
end

obsidian.setup({
    dir = "~/iCloud/Obsidian/tourist",
    completion = {
        nvim_cmp = true,
    },
    notes_subdir = "Page",
    daily_notes = {
        folder = "Daily/everyday"
    },
})
