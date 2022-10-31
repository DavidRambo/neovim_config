require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    -- A list of parser names
    ensure_installed = {
        "c", "python", "lua", "bash", "vim", "dockerfile",
        "html", "json", "java", "javascript", "markdown", "scheme"
    },

    sync_install = false
}
