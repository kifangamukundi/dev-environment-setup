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
      padding = true,
      sticky = true,
      ignore = nil,
      mappings = {
        basic = true,
        extra = true,
        extended = false,
      },
      toggler = {
        line = '<leader>cl',  -- Toggle line comment
        block = '<leader>cb', -- Toggle block comment
      },
      opleader = {
        line = '<leader>cl',  -- Line comments in Visual mode
        block = '<leader>cb', -- Block comments in Visual mode
      },
      extra = {
        above = '<leader>ck', -- Add comment on the line above
        below = '<leader>cj', -- Add comment on the line below
        eol = '<leader>ce',   -- Add comment at the end of line
      },
      pre_hook = ts_context_commentstring.create_pre_hook(),
      post_hook = nil,
    })
    
    -- Set up ts-context-commentstring plugin
    require('ts_context_commentstring').setup()
  end,
}