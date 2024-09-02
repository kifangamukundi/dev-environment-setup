return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = actions.select_tab,
            ["<C-o>"] = trouble_telescope.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help tags" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy find in current buffer" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
    keymap.set("n", "<leader>fgf", "<cmd>Telescope git_files<CR>", { desc = "Find git files" })
    keymap.set("n", "<leader>fgs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
    keymap.set("n", "<leader>fhc", "<cmd>Telescope command_history<CR>", { desc = "Command history" })
    keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Find marks" })
    keymap.set("n", "<leader>frg", "<cmd>Telescope registers<CR>", { desc = "Find registers" })
    keymap.set("n", "<leader>fd", "<cmd>Telescope commands<CR>", { desc = "Find Commands" })
    keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Find Keymaps" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find Symbols" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}