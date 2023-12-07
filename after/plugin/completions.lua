local cmp = require('cmp')

-- Setup Key Mappings
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil
})

local cmp_format = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", vim_item.kind)
        vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
        })[entry.source.name]
        return vim_item
    end,
  }

-- TODO: Make Snippets Work Cool and stuff my dude brody
require("luasnip.loaders.from_vscode").lazy_load()

-- TODO: Setup spell
-- local spell_opt = {
--     keep_all_entries = false,
--     enable_in_contex = function() 
--         return true
--     end,
-- }

cmp.setup({
    mapping = cmp_mapping,
    formatting = cmp_format,
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    sources = cmp.config.sources({
        -- {
            { name = 'nvim_lsp'},
            { name = 'luasnip' },
        -- }, {
            { name = 'buffer' },
            { name = 'path' },
            -- { name = 'spell', option = spell_opt },
        -- }
    }),
})

-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--             { name = 'cmdline' }
--         })
-- })
