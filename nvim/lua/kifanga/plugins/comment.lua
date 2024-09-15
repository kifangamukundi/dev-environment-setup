return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- Import Comment plugin safely
    local comment = require("Comment")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- Enable comment with custom configuration
    comment.setup({
      ---Add a space between comment and the line
      padding = true,

      ---Whether the cursor should stay at its position
      sticky = true,

      ---Lines to be ignored while comment/uncomment.
      ignore = nil,

      ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
      mappings = {
        basic = true,  -- operator-pending mapping like gcc, gcb
        extra = true,  -- extra mappings like gco, gcO
        extended = false, -- extended mappings like g>, g<
      },

      ---LHS of toggle mapping in NORMAL + VISUAL mode
      toggler = {
        line = '<leader>gcc',  -- Change to a different keymap
        block = '<leader>gbc', -- Change to a different keymap
      },

      ---LHS of operator-pending mapping in NORMAL + VISUAL mode
      opleader = {
        line = '<leader>gc',   -- Change to a different keymap
        block = '<leader>gb',  -- Change to a different keymap
      },

      ---LHS of extra mappings
      extra = {
          ---Add comment on the line above
          above = '<leader>gcO',
          ---Add comment on the line below
          below = '<leader>gco',
          ---Add comment at the end of line
          eol = '<leader>gcA',
      },

      ---Pre-hook for tsx, jsx, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),

      ---Post-hook, called after commenting is done
      post_hook = nil,
    })

    -- Set up ts-context-commentstring plugin
    require('ts_context_commentstring').setup()
  end,
}