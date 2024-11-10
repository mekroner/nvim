require('rose-pine').setup({
    disable_background = true
})

require('flow').setup({
    transparent = true
})

function ColorMePencils(color)
    -- color = color or "astolfo"
    color = color or "rose-pine"
    -- color = color or "flow"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

ColorMePencils()
