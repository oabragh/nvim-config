return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = "mocha",
                integrations = {
                    harpoon = true,
                    mason = true,
                    noice = true,
                    treesitter = true,
                    which_key = false,
                    telescope = {
                        enabled = true
                    }
                }
            })
        end
    },
}
