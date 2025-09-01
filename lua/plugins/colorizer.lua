return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB
        RRGGBB = true, -- #RRGGBB
        RRGGBBAA = true, -- #RRGGBBAA
        names = true, -- “Blue”
        tailwind = true, -- tailwind classes
      })
    end,
  },
}
