return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    "glepnir/lspsaga.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspsaga = require("lspsaga")

    lspsaga.setup({
      ui = {
        border = "rounded",
        title = true,
      },
      symbol_in_winbar = {
        enable = true,
      },
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

      --   To choose an option use ctrl + o or o

        local mappings = {
          { "n", "<leader>lR", ":LspRestart<CR>", "Restart LSP" },
      
          -- Quickly navigate to places where a function, variable, or class is defined or used in your code.
          { "n", "<leader>lf", "<cmd>Lspsaga finder<CR>", "LSP Finder" },

          -- Quickly understand the purpose or usage of a function, class, or variable without leaving your current context.
          { "n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },

          -- Refactor your code by renaming symbols seamlessly without manually changing them everywhere
          { "n", "<leader>lr", "<cmd>Lspsaga rename<CR>", "Rename" },
      
          -- Quickly apply fixes, such as importing a missing module, correcting a typo, or optimizing code.
          { { "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>", "Code Actions" },

          { "n", "<leader>lB", "<cmd>Lspsaga show_buf_diagnostics<CR>", "Buffer Diagnostics" },
          { "n", "<leader>lL", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
      
          { "n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic" },
          { "n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
      
          -- Helps you track which parts of the code rely on the current function. 
          { "n", "<leader>li", "<cmd>Lspsaga incoming_calls<CR>", "Incoming Calls" },

          -- See what resources or methods the current function uses
          { "n", "<leader>lo", "<cmd>Lspsaga outgoing_calls<CR>", "Outgoing Calls" },

          -- Quickly inspect a function or variable definition without leaving your current place in the code
          { "n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },

          -- Useful in strongly-typed languages like TypeScript or Go to inspect type details.
          { "n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", "Peek Type Definition" },
      
          { "n", "<leader>lT", "<cmd>Lspsaga outline<CR>", "Toggle Outline" },
          { "n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", "Workspace Diagnostics" },
      }        

        for _, map in ipairs(mappings) do
          opts.desc = map[4]
          keymap.set(map[1], map[2], map[3], opts)
        end
      end,
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({ capabilities = capabilities })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              completion = { callSnippet = "Replace" },
            },
          },
        })
      end,
      ["emmet_ls"] = function()
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
        })
      end,
    })
  end,
}
