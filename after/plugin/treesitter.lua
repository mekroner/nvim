require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "javascript",  "typescript",
        "c", "vim", "html", "lua", "rust", "python",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}
