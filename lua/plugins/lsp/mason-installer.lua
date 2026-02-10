return {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VimEnter", -- lazy-load immediately after Neovim starts
        dependencies = {
                "mason-org/mason.nvim",
        },
        opts = {
                ensure_installed = {
                        "lua-language-server",
                        "luacheck",
                        "pyright",
                        "ruff",
                        "black",
                        "clangd",
                        "clang-format",
                        "cpplint",
                },
                auto_update = true,
                debug = true,
        },
}
