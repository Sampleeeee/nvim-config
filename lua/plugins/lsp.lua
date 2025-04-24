return
{
	{
	    "neovim/nvim-lspconfig",
	    config = function()
            local config = require( "lspconfig" )

            config.lua_ls.setup( {
                settings = { Lua = { diagnostics = { globals = { "vim" } } } }
            } )
	    end
	},
	{
	    "nvim-treesitter/nvim-treesitter",
	    build = ":TSUpdate",
	    config = function()
            require( "nvim-treesitter.configs").setup( {
                ensure_installed = { "lua" },
                highlight = { enable = true }
            })
	    end
	},

    -- <leader>/ for comments
    {
        "numToStr/Comment.nvim",
        config = function()
            local api = require( "Comment.api" )

            vim.keymap.set( 'n', '<leader>/', api.toggle.linewise.current, { desc = 'Toggle comment' } )
            vim.keymap.set( 'v', '<leader>/', function()
                api.toggle.linewise( vim.fn.visualmode() )
            end, { noremap = true, silent = true, desc = 'Toggle comment' } )
        end
    },

    -- Auto complete
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "L3MON4D3/LuaSnip" },
        config = function()
            local cmp = require( "cmp" )

            cmp.setup( {
                snippet = {
                    expand = function( args )
                        require( "luasnip" ).lsp_expand( args.body )
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert( {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-j>'] = cmp.mapping.scroll_docs( -4 ),
                    ['<C-k>'] = cmp.mapping.scroll_docs( 4 ),

                    ['<CR>'] = cmp.mapping.confirm( { select = true } )
                } ),
                sources = cmp.config.sources( {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, { name = "buffer" } )
            } )

            local capabilities = require( 'cmp_nvim_lsp' ).default_capabilities()
            require('lspconfig')['lua_ls'].setup( {
                capabilities = capabilities
            } )
        end
    },
    {
        "hrsh7th/cmp-buffer"
    },

    -- Lua
    {
        "L3MON4D3/LuaSnip",
        version = "v2.3.0",
        build = "make install_jsregexp"
    },
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "saadparwaiz1/cmp_luasnip",
    },

    -- Rust
    {
        "rust-lang/rust.vim",
    },
    {
        "mrcjkb/rustaceanvim",
        ft = { "rust" }
    }
}
