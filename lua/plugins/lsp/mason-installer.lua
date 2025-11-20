return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    opts = {
        ensure_installed = {
            "lua-language-server",
            "luacheck",
        },
        auto_update = true,
        run_on_start = true,
    },
}
