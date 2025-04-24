return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
        },
        config = function()
            local builtin = require( "telescope.builtin" )

            vim.keymap.set( 'n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' } )
            vim.keymap.set( 'n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' } )
            vim.keymap.set( 'n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' } )
            vim.keymap.set( 'n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope recent files' } )
        end
    },
    {
        "ThePrimeagen/harpoon",
        config = function()
            local harpoon = require( "harpoon.mark" )
            local ui = require( "harpoon.ui" )

            vim.keymap.set( 'n', '<leader>fa', harpoon.add_file, { desc = "Add file to harpoon" } )
            vim.keymap.set( 'n', '<leader>fb', ui.toggle_quick_menu, { desc = 'Harpoon quick menu' } )
            vim.keymap.set( 'n', '<leader>fn', ui.nav_next, { desc = 'Harpoon next file' } )
            vim.keymap.set( 'n', '<leader>fp', ui.nav_prev, { desc = 'Harpoon previous file ' } )

            for i = 1, 5 do
                vim.keymap.set(
                    'n', '<leader>f' .. tostring( i ),
                    function() ui.nav_file( tonumber( i ) ) end,
                    { desc = 'Harpoon file #' .. tostring( i )
                } )
            end
        end
    }
}
