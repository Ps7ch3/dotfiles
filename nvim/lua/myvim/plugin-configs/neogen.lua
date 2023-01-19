local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
	return
end

neogen.setup {
    enabled = true,
    input_after_comment = true,
    snippet_engine = "luasnip",
    languages = {
        python = {
            template = {
                annotation_convention = "google_docstrings"
            }
        }
    }
}
