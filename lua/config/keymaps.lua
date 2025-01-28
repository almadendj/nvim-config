-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Instant scrolling with Ctrl+U/D
-- vim.keymap.set("n", "<C-u>", "<C-u>", { desc = "Scroll up instantly" })
-- vim.keymap.set("n", "<C-d>", "<C-d>", { desc = "Scroll down instantly" })

-- Instant faster scrolling with Shift+Ctrl+U/D
-- vim.keymap.set("n", "<S-C-u>", "10<C-u>", { desc = "Scroll up very fast instantly" })
-- vim.keymap.set("n", "<S-C-d>", "10<C-d>", { desc = "Scroll down very fast instantly" })

vim.keymap.set("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git blame for file" })

vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>", { desc = "Git status (modified/added files)" })

vim.keymap.set("n", "<leader>pd", function()
  local file_path = vim.fn.expand("%:p") -- Get the full path of the current file
  local repo_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1] -- Get the repo root
  if repo_root == "" then
    print("Not in a git repository")
    return
  end
  local relative_path = file_path:sub(#repo_root + 2) -- Get the relative path including the file name
  vim.fn.setreg("+", relative_path) -- Copy to the system clipboard
  print("Copied to clipboard: " .. relative_path) -- Print confirmation
end, { desc = "Copy current file path relative to repo root to clipboard" })

-- Diagnostic keymaps
vim.keymap.set("n", "]e", function()
  vim.diagnostic.goto_next()
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[e", function()
  vim.diagnostic.goto_prev()
end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>de", function()
  vim.diagnostic.open_float()
end, { desc = "Show diagnostic details" })

-- Debugging keymaps
vim.keymap.set("n", "<leader>dt", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Continue" })

vim.keymap.set("n", "<leader>dso", function()
  require("dap").step_over()
end, { desc = "Step Over" })

vim.keymap.set("n", "<leader>dsi", function()
  require("dap").step_into()
end, { desc = "Step Into" })

vim.keymap.set("n", "<leader>dsu", function()
  require("dap").step_out()
end, { desc = "Step Out" })

vim.keymap.set("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Breakpoint Condition" })

vim.keymap.set("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
