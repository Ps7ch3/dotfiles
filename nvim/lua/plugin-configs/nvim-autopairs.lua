local ok, autopairs = pcall(require, "nvim-autopairs")

if not ok then
    return
end

autopairs.setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
    enable_check_bracket_line = true,
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    }
})

