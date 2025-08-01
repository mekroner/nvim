local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    ---- colorscheme
    { 'rose-pine/neovim',   as = 'rose-pine' },
    { '0xstepit/flow.nvim', as = 'flow' },
    -- { dir='~/.config/astolfo.nvim/', as = 'astolfo' },
    'nvim-treesitter/nvim-treesitter',
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    ----    -- completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    -- 'f3fora/cmp-spell',

    'nvim-tree/nvim-web-devicons',
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },

    ---- luasnip
    "saadparwaiz1/cmp_luasnip",
    'L3MON4D3/LuaSnip',
    "rafamadriz/friendly-snippets",
    ----lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    ---- the goat
    'tpope/vim-commentary',
    'tpope/vim-surround',

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    'lukas-reineke/indent-blankline.nvim',

    'simrat39/symbols-outline.nvim',
    'lewis6991/gitsigns.nvim',
    'HiPhish/rainbow-delimiters.nvim',

    -- code outline
    'stevearc/aerial.nvim',
    'github/copilot.vim',

}

local opts = {}

require("lazy").setup(plugins, opts)
