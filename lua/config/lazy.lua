local lazypath = vim.fn.stdpath( "data" ) .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat( lazypath ) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system( { "git", "clone", "--filter-blob:none", "--branch=stable", lazyrepo, lazypath } )

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo( {
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Vim options
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Use four spaces instead of tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.smartindent = true

-- Disable mouse
vim.opt.mouse = ""

-- Enable inline comments
-- vim.diagnostic.config( {
    -- virtual_text = {
        -- prefix = "●",
        -- spacing = 2,
        -- source = "always", -- always or if_many
    -- },

    -- signs = true,
    -- underline = true,
    -- update_in_insert = true,
    -- severity_sort = true
-- } )

-- diagnostic comments in a window
vim.o.updatetime = 500

vim.api.nvim_create_autocmd( "CursorHold", {
    callback = function()
        vim.diagnostic.open_float( nil, {
            focusable = false,
            border = "rounded",
            source = "always",
            prefix = "",
            scope = "cursor"
        } )
    end
} )

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },

    -- Configure any other settings here. See the documentation for more details.
    install = {
        -- colorscheme that will be used when installing plugins.
        colorscheme = { "habamax" }
    },

    -- automatically check for plugin updates
    checker = { enabled = true },
} )
