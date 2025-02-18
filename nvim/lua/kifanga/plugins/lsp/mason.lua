return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "gopls",         -- Go language server
        "pyright",       -- Python language server
        "ts_ls",         -- TypeScript language server
        "rust_analyzer", -- Rust language server
        "clangd",        -- C/C++ language server
        "lua_ls",        -- Lua language server
        "eslint",        -- ESLint
        "html",          -- HTML language server
        "cssls",         -- CSS language server
        "tailwindcss",   -- Tailwind CSS language server
      },
      automatic_installation = true,
    })
  end,
}
