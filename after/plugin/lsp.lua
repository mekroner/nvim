require('mason').setup()
local mlsp = require('mason-lspconfig')
local lspcfg = require('lspconfig')
local lsp_defaults = lspcfg.util.default_config

mlsp.setup({
    ensure_installed = {
        'lua_ls',
        -- 'rust_analyzer',
        -- 'pyright',
        -- 'clangd',
    },
    automatic_installation = true,
})

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

lspcfg.lua_ls.setup {
    settings = {
        Lua = {
            diagnostic = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
        }
    }
}

-- lspcfg.rust_analyzer.setup {
--     filetypes = { "rust" },
--     root_dir = lspcfg.util.root_pattern("Cargo.toml"),
--     settings = {
--         ['rust_analyzer'] = {
--             cargo = {
--                 allFeatures = true,
--             },
--             checkOnSave = {
--                 command = "clippy",
--             },
--         }
--     }
-- }

-- lspcfg.pyright.setup {
--     filetypes = { "python" },
-- }

-- lspcfg.ocamllsp.setup {
--     cmd = { "ocamllsp" },
--     filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
--     root_dir = lspcfg.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
-- }

-- lspcfg.clangd.setup { }

-- lspcfg.wgsl_analyzer.setup {
--     filetypes = { "wgsl" },
-- }

-- lspcfg.ts_ls.setup{}
-- lspcfg.cssls.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- 3) Grab the list of all servers Mason has installed
local installed = mlsp.get_installed_servers()

-- 4) Loop and call setup on each one
for _, name in ipairs(installed) do
    lspcfg[name].setup({
        capabilities = capabilities,
        -- you can define a common on_attach here if you like:
        -- on_attach = function(client, bufnr) … end,
    })
end


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.diagnostic.config({
    virtual_text = true
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>fm', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
