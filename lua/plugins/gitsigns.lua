return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true, -- Enable persistent blame
    current_line_blame_opts = {
      virt_text = true, -- Show blame inline
      virt_text_pos = "eol", -- Show blame at the end of the line
      delay = 300, -- Reduce delay to 300ms (or set to 0 for instant blame)
      ignore_whitespace = false,
    },
  },
}
