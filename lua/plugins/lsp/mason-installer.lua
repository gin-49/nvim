return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VimEnter", -- lazy-load immediately after Neovim starts
  dependencies = {
    "mason-org/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "lua-language-server", -- Lua
      "luacheck",
      "pyright",             -- Python
      "ruff",
      "black",
      "clangd", -- C / C++
      "clang-format",
      "cpplint",
      "tinymist", -- Typst
    },
    auto_update = true,
    debug = true,
  },
}
