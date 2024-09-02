local M = {}

function M.setup()
    -- Define colors for indent levels and active block
    local indent_color = "#505050"  -- Dominant Gray for all indent levels
    local active_color = "#C0C0C0"  -- Thin Gray for the active block

    -- Apply the dominant gray color to all indent levels
    for i = 1, 50 do
        vim.api.nvim_set_hl(0, "IndentLevel" .. i, { fg = indent_color })  -- Use the dominant gray color for all indent levels
    end

    -- Highlight for the active block (scope)
    vim.api.nvim_set_hl(0, "ActiveIndent", { fg = active_color, bold = true }) -- Thin Gray for the active indent
end

return M
