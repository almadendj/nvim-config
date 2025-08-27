return {
  -- 1) Prisma syntax / filetype
  {
    "prisma/vim-prisma",
    ft = { "prisma" },
    -- optional: highlight groups, etc.
  },

  -- 2) Treesitter grammar for Prisma
  {
    "nvim-treesitter/nvim-treesitter",
    -- we override the default `ensure_installed` list to add "prisma"
    opts = function(_, opts)
      -- make sure opts.ensure_installed is a table
      opts.ensure_installed = opts.ensure_installed or {}
      -- only add once
      if not vim.tbl_contains(opts.ensure_installed, "prisma") then
        table.insert(opts.ensure_installed, "prisma")
      end
    end,
  },

  -- 3) Prisma Language Server via nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- `prismals` is the name used by nvim-lspconfig
        prismals = {
          -- by default the server binary is `prisma-language-server`
          -- make sure you have it installed in your $PATH
          cmd = { "prisma-language-server", "--stdio" },
          filetypes = { "prisma" },
          -- you can add on_attach / capabilities here as needed
        },
      },
    },
  },
}
