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
        "lua_ls",        -- Lua
        "ts_ls",         -- JavaScript/TypeScript
        "html",          -- HTML
        "cssls",         -- CSS
        "emmet_ls",      -- Emmet
        "eslint",        -- ESLint
        "tailwindcss",   -- Tailwind CSS
        "gopls",         -- Go language server
      },
      automatic_installation = true,
    })
  end,
}
