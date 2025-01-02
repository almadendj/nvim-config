-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.maplocalleader = "\\"
require("config.lazy")
--
-- -- Enable true color support
vim.opt.termguicolors = true
--
-- Set transparency for active and inactive windows in the editor
--
-- Set transparency for Neo-tree (active and inactive windows)
-- vim.cmd("hi NeoTreeNormal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi NeoTreeNormalNC guibg=NONE ctermbg=NONE")
-- --
-- -- Optional: Also make floating Neo-tree transparent if used
-- vim.cmd("hi NeoTreeFloatNormal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi NeoTreeFloatBorder guibg=NONE ctermbg=NONE")
-- -- Set transparency for the main editor background
-- -- TODO: uncomment this when you want to enable blurred background
-- --
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")

-- Optional: Make floating windows and borders transparent
vim.cmd("hi FloatNormal guibg=NONE ctermbg=NONE")
vim.cmd("hi FloatBorder guibg=NONE ctermbg=NONE")

-- Optional: Make sign column (gutter) transparent
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")

-- Optional: Make status line and tabline transparent
vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")
vim.cmd("hi TabLine guibg=NONE ctermbg=NONE")
vim.cmd("hi TabLineFill guibg=NONE ctermbg=NONE")
-- Set transparency for Neo-tree's active window
vim.cmd("hi NeoTreeNormal guibg=NONE ctermbg=NONE")

-- Set transparency for Neo-tree's inactive window
vim.cmd("hi NeoTreeNormalNC guibg=NONE ctermbg=NONE")

-- Optional: Make floating Neo-tree windows transparent if you're using them
vim.cmd("hi NeoTreeFloatNormal guibg=NONE ctermbg=NONE")
vim.cmd("hi NeoTreeFloatBorder guibg=NONE ctermbg=NONE")

-- Optional: Make Neo-tree end-of-buffer indicator transparent
vim.cmd("hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE")

vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

if vim.g.neovide then
  -- Map Command + C to copy (normal and visual mode)
  vim.keymap.set({ "n", "x" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" })

  -- Map Command + V to paste (normal and visual mode)
  vim.keymap.set({ "n", "x" }, "<D-v>", '"+p', { desc = "Paste from system clipboard" })

  -- Map Command + V to paste in insert mode with auto-indentation disabled
  vim.keymap.set("i", "<D-v>", function()
    -- Disable auto-commenting and auto-indentation
    vim.opt.paste = true
    -- Insert clipboard content
    local clipboard_content = vim.fn.getreg("+")
    -- Re-enable indentation after pasting
    vim.opt.paste = false
    return clipboard_content
  end, { expr = true, desc = "Paste from system clipboard in insert mode without extra indentation or comments" })
end

local alpha = function()
  return string.format("%x", math.floor(255 * 0.8))
end

if vim.g.neovide then
  -- Set transparency (e.g., 0.8 means 80% opacity)
  vim.g.neovide_transparency = 0.2
  vim.g.transparency = 0
  vim.g.neovide_background_color = "#0f1117" .. alpha()

  -- Enable background blur
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 0.8
  vim.g.neovide_floating_blur_amount_y = 0.8
end
