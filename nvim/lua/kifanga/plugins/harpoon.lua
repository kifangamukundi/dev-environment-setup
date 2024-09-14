return {
  "ThePrimeagen/harpoon",
  enabled = true,
  event = { "InsertEnter", "CmdLineEnter" },
  branch = "harpoon2",
  commit = 'e76cb03', -- for when harpoon doesn't account for cd
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },

  keys = function()
    local harpoon = require("harpoon")
    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local make_finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(paths, item.value)
        end

        return require("telescope.finders").new_table({
          results = paths,
        })
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = make_finder(),
          previewer = false,
          sorter = conf.generic_sorter({}),
          layout_strategy = "center",
          layout_config = {
            width = function(_, max_columns, _)
              return math.min(max_columns, 80)
            end,
            height = function(_, _, max_lines)
              return math.min(max_lines, 15)
            end,
          },
          borderchars = {
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
          attach_mappings = function(prompt_buffer_number, map)
            map("i", "<C-d>", function()
              local state = require("telescope.actions.state")
              local selected_entry = state.get_selected_entry()

              if selected_entry then
                -- Remove the selected entry from Harpoon
                harpoon:list():remove(selected_entry)

                -- Refresh the picker immediately
                local current_picker = state.get_current_picker(prompt_buffer_number)
                current_picker:refresh(make_finder(), { reset_prompt = true })
              end
            end)

            return true
          end,
        })
        :find()
    end

    return {
      -- Harpoon marked files 1 through 4 with leader key
      { "<leader>1", function() harpoon:list():select(1) end, desc = "Harpoon buffer 1" },
      { "<leader>2", function() harpoon:list():select(2) end, desc = "Harpoon buffer 2" },
      { "<leader>3", function() harpoon:list():select(3) end, desc = "Harpoon buffer 3" },
      { "<leader>4", function() harpoon:list():select(4) end, desc = "Harpoon buffer 4" },

      -- Harpoon next and previous with leader key
      { "<leader>rn", function() harpoon:list():next() end, desc = "Harpoon next buffer" },
      { "<leader>rp", function() harpoon:list():prev() end, desc = "Harpoon prev buffer" },

      -- Harpoon user interface with leader key
      -- { "<leader>ru", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Toggle Menu" },
      { "<leader>ra", function() harpoon:list():add() end, desc = "Harpoon add file" },

      -- Use Telescope as Harpoon user interface with leader key
      { "<leader>rt", function() toggle_telescope(harpoon:list()) end, desc = "Open Harpoon window" },
    }
  end,

  opts = function(_, opts)
    opts.settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
      mark_branch = false,
      key = function()
        return vim.loop.cwd()
      end,
    }
  end,

  config = function(_, opts)
    require("harpoon").setup(opts)
  end,
}
