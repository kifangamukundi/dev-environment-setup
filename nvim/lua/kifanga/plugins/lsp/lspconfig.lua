return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
  

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Configure diagnostics
    vim.diagnostic.config({
      virtual_text = true,  -- To show inline diagnostics
      signs = true,         -- To show signs (indicators) in the gutter
      update_in_insert = true,  -- Update diagnostics while typing
      underline = true,     -- Underline errors/warnings
      float = {
        border = "rounded",  -- You can change the border style (rounded, single, etc.)
        source = "always",   -- Show the source of the error (e.g., LSP)
        header = "",         -- Can be left empty or customized
        max_width = 120,     -- Set a max width for the float window, you can adjust this value
        max_height = 15,     -- Optionally, you can limit the height as well
      },
    })
    

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        local mappings = {
          -- add keymaps here later
          -- Ctrl-o: Go to the previous position in the buffer history (backwards).
          -- Ctrl-i: Go to the next position in the buffer history (forwards).
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
      -- Add gopls configuration
      ["gopls"] = function()
        lspconfig.gopls.setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            -- Auto format and organize imports on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
                vim.lsp.buf.code_action({
                  context = { only = { "source.organizeImports" } },
                  apply = true,
                })
              end,
            })
          end,
          settings = {
            gopls = {
              gofumpt = true, -- Use gofumpt for stricter formatting
              staticcheck = true, -- Enable static analysis
              analyses = {
                unusedparams = true,
              },
            },
          },
        })
      end,
      ["pyright"] = function()
        lspconfig.pyright.setup({
          capabilities = capabilities,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",  -- Can be "basic" or "strict"
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        })
      end,
      ["ts_ls"] = function()
        lspconfig.ts_ls.setup({
          capabilities = capabilities,
          settings = {
            javascript = { format = { enable = true } },
            typescript = { format = { enable = true } },
          },
        })
      end,
      ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup({
          capabilities = capabilities,
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              procMacro = { enable = true },
            },
          },
        })
      end,
      ["clangd"] = function()
        lspconfig.clangd.setup({
          capabilities = capabilities,
          settings = {
            clangd = {
              arguments = { "--header-insertion=never" },
            },
          },
        })
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },  -- Recognize vim global in Neovim Lua configs
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            },
          },
        })
      end,
      ["eslint"] = function()
        lspconfig.eslint.setup({
          capabilities = capabilities,
          on_attach = function(client)
            -- Linting on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              callback = function()
                vim.lsp.buf.format({ async = true })
              end,
            })
          end,
        })
      end,
      ["html"] = function()
        lspconfig.html.setup({
          capabilities = capabilities,
          settings = {
            html = {
              format = { enable = true },
            },
          },
        })
      end,
      ["cssls"] = function()
        lspconfig.cssls.setup({
          capabilities = capabilities,
          settings = {
            css = {
              validate = true,
              lint = { unknownAtRules = "ignore" },
            },
          },
        })
      end,
      ["tailwindcss"] = function()
        lspconfig.tailwindcss.setup({
          capabilities = capabilities,
          settings = {
            tailwindCSS = {
              validate = true,  -- Enable validation for Tailwind classes
              includeLanguages = {
                css = "css",      -- Include CSS files
                html = "html",    -- Include HTML files
                javascript = "javascript",  -- Include JS files
                typescript = "typescript",  -- Include TypeScript files
                -- Add more languages if needed (e.g., JSX, TSX)
              },
            },
          },
        })
      end,
    })
  end,
}
