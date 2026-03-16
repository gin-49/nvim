return {
  "Shatur/neovim-ayu",
  priority = 1000,
  config = function()
    require("ayu").setup({
      overrides = {
        Normal = { bg = "None" },
        NormalFloat = { bg = "None" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        VertSplit = { bg = "None" },
        -- Line number customizations
        LineNr = { fg = "#82a8c7" },                    -- Regular relative line numbers
        CursorLineNr = { fg = "#E6B450", bold = true }, -- Current line number
      },
    })
    vim.cmd.colorscheme("ayu")
  end,
}
