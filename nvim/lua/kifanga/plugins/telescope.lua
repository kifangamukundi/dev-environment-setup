return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local add_to_arglist = function(prompt_bufnr)
      local selection = require("telescope.actions.state").get_selected_entry()
      if selection then
        local arglist = vim.fn.argv()
        local already_exists = vim.tbl_contains(arglist, selection.value)
        
        if already_exists then
          print("File is already in the arglist: " .. selection.value)
        else
          vim.cmd("argadd " .. selection.value)
          print("Added to arglist: " .. selection.value)
        end
      end
    end
    
    local remove_from_arglist = function(prompt_bufnr)
      local selection = require("telescope.actions.state").get_selected_entry()
      if selection then
        vim.cmd("argdel " .. selection.value)
        print("Removed from arglist: " .. selection.value)
    
        local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local updated_arglist = vim.fn.argv()
    
        current_picker:refresh(
          require("telescope.finders").new_table({
            results = updated_arglist,
          }),
          { reset_prompt = true }
        )
      end
    end

    -- use control q to add to quicklist
    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-a>"] = add_to_arglist,
            ["<C-r>"] = remove_from_arglist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap
    keymap.set("n", "<leader>fa", function()
      local arglist = vim.fn.argv()

      if #arglist == 0 then
        print("Arglist is empty")
        return
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Select File from Arglist",
        finder = require("telescope.finders").new_table({
          results = arglist,
        }),
        sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr, map)
          map("i", "<CR>", function()
            local selection = require("telescope.actions.state").get_selected_entry()
            if selection then
              vim.cmd("edit! " .. selection.value)
            end
          end)
          return true
        end,
      }):find()
    end, { desc = "Select from Arglist using Telescope" })

    -- Telescope keymaps
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Find diagnostics" })
    keymap.set("n", "<leader>fB", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy find in current buffer" })
    keymap.set("n", "<leader>ft", "<cmd>Telescope help_tags<CR>", { desc = "Find help tags" })
    keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
    keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Find marks" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope registers<CR>", { desc = "Find registers" })
    keymap.set("n", "<leader>fR", "<cmd>Telescope lsp_references<CR>", { desc = "LSP References" })
    keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Find keymaps" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope commands<CR>", { desc = "Find commands" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope command_history<CR>", { desc = "Command history" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP Symbols" })
    keymap.set("n", "<leader>fl", "<cmd>Telescope loclist<CR>", { desc = "Find location List" })
  end,
}
