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
      virtual_text = true,
      signs = true,
      update_in_insert = true,
      underline = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        max_width = 120,
        max_height = 15,
      },
    })
    

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap
        
        local mappings = {
          -- Jumplist control o and control i
          -- Taglist control t
          { 'n', '<leader>dd', vim.lsp.buf.declaration, "Go to Declaration" },
          { 'n', '<leader>df', vim.lsp.buf.definition, "Go to Definition" },
          { 'n', '<leader>dt', vim.lsp.buf.type_definition, "Go to Type Definition" },
          { 'n', '<leader>K', vim.lsp.buf.hover, "Hover Documentation" },
          { 'n', '<leader>di', vim.lsp.buf.implementation, "Go to Implementation" },

          -- This opens a quick fix list that we can use for all the references
          { 'n', '<leader>dr', vim.lsp.buf.references, "Go to References" },
          { 'n', '<leader>dn', vim.diagnostic.goto_next, "Go to next Diagnostic" },
          { 'n', '<leader>dp', vim.diagnostic.goto_prev, "Go to previous Diagnostic" },

          { 'n', '<leader>ds', vim.lsp.buf.signature_help, "Signature Help" },
          { 'n', '<leader>da', vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
          { 'n', '<leader>dx', vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
          { 'n', '<leader>do', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List Workspace Folders" },
          { 'n', '<leader>dR', vim.lsp.buf.rename, "Rename" },
          { { 'n', 'v' }, '<leader>dA', vim.lsp.buf.code_action, "Code Action" },
        }        

        for _, map in ipairs(mappings) do
          opts.desc = map[4]
          keymap.set(map[1], map[2], map[3], opts)
        end
      end,
    })

    -- location list staff
    vim.api.nvim_create_autocmd("DiagnosticChanged", {
      callback = function(args)
        if not vim.g.quitting then
          vim.diagnostic.setloclist({ open = false })
        end
      end,
    })
    vim.api.nvim_create_autocmd("QuitPre", {
        callback = function()
            vim.g.quitting = true
        end,
    })
    
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({ capabilities = capabilities })
      end,
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
              gofumpt = true,
              staticcheck = true,
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
                typeCheckingMode = "basic",
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
              -- Recognize vim global in Neovim Lua configs
              diagnostics = { globals = { "vim" } },  
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
              validate = true,
              includeLanguages = {
                css = "css",
                html = "html",
                javascript = "javascript",
                typescript = "typescript",
              },
            },
          },
        })
      end,
      ["svelte"] = function()
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
    })
  end,
}
