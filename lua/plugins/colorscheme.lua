return {
  -- Add high contrast themes
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "ishan9299/nvim-solarized-lua", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true }, -- Another good high contrast option
  
  -- Keep existing catppuccin config
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  -- Update LazyVim config
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa", -- Changed default to kanagawa
      colorschemes = {
        "gruvbox",
        "solarized", 
        "kanagawa",
        "tokyonight-storm"
      }
    }
  }
}
