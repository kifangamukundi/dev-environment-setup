return {
    {
        "lukas-reineke/indent-blankline.nvim",
        name = "indent_blankline",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("ibl").setup({
                indent = { char = "│", highlight = "IndentLevel1" },  -- Use the same highlight for all indents
                scope = {
                    enabled = true,  -- Enable the scope context
                    highlight = { "ActiveIndent" },  -- Use the ActiveIndent highlight group for active scope
                },
            })

            local hooks = require("ibl.hooks")

            -- Register the highlight setup using hooks
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                -- M.setup()  -- Call the setup function for highlights
            end)
        end,
    },
}
