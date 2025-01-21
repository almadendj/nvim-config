return {
  -- Add verible (Verilog formatter and linter) to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "verible")
    end,
  },

  -- Add Verilog to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "verilog" })
      end
    end,
  },

  -- Configure LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        verible = {
          -- You can add verible-specific settings here
        },
      },
    },
  },

  -- Configure formatting
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      if not opts.formatters_by_ft.verilog then
        opts.formatters_by_ft.verilog = { "verible-verilog-format" }
      end
    end,
  },
}
