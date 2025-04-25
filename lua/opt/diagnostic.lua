local function enable_inline_diag()
    -- Enable inline comments
    vim.diagnostic.config( {
        virtual_text = {
            prefix = "●",
            spacing = 2,
            source = "always", -- always or if_many
        },

        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true
    } )
end

local function enable_box_diag()
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
end

enable_box_diag()
