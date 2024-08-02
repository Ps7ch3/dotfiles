local mini_files_status_ok, mini_files = pcall(require, "mini.files")
if not mini_files_status_ok then
    return
end

mini_files.setup()
