
-- Check spelling of current word 
vim.keymap.set( 'n', '<leader>ps', ':Telescope spell_suggest<CR>', { desc = 'Telescope spelling' } )

-- Todo telescope 
vim.keymap.set( 'n', '<leader>pt', ':TodoTelescope<CR>', { desc = 'Telescope todo' } )

TROUBLE_PLUGIN_KEYS = {
    {
        "<leader>pq",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (trouble)"
    },
    {
        "<leader>pQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix list (trouble)"
    }
}

