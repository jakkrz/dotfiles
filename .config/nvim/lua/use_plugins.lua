local function usePlugins(use)
    use { 
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }
    
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {"nvim-tree/nvim-web-devicons"}
    }

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }
    
    use { "nvim-treesitter/nvim-treesitter" }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    }

    -- Autocomplete
    use {
        "hrsh7th/nvim-cmp",
        requires = { "hrsh7th/cmp-nvim-lsp" }
    }

    use {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.0",
      requires = { {"nvim-lua/plenary.nvim"} }
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = false,
                    theme = "onedark",
                    component_separators = "|",
                    section_separators = "",
                }
            }
        end
    }

end

return usePlugins
