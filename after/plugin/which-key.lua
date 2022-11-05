local which_key_setup, wk = pcall(require, "which-key")
if not which_key_setup then
    return
end

wk.setup()

wk.register({
    ["<leader>d"] = {
        name = "diagnostics",
    },
    ["<leader>b"] = {
        name = "buffers",
    },
    {
        ["<leader>f"] = {
            name = "File",
            s = { "Save" },
        }
    },
    ["<leader>s"] = {
        name = "search",
        p = { "Telescope project" },
        h = { "Telescope help tags" },
    },
    ["<leader>."] = { "Find File" },
    ["<leader>,"] = { "Find Buffer" },
    ["<leader>t"] = {
        name = "Tabs",
        n = { "Create Tab" },
        h = { "Previous Tab" },
        o = { "Next Tab" },
    },
    ["<leader>w"] = {
        name = "Windows",
        v = { "Vertical Split" },
        s = { "Horizontal Split" },
        n = { "Focus Left" },
        i = { "Focus Right" },
        u = { "Focus Up" },
        e = { "Focus Down" },
    },
})
