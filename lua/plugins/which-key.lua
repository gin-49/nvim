return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        layout = {
            height = { min = 4, max = 40 },   -- allow tall menus
            width  = { min = 20, max = 60 },  -- wider menu to avoid truncation
            spacing = 5,                      -- more space between columns
            align = "left",                   -- better readability
        },
    },
}
