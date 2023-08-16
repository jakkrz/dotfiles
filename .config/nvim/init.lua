-- Configuration
vim.g.mapleader = " "
vim.g.netrw_banner = 0

-- Options
local options = require("options")

local optionsErrorString = options.applyOptions(options.options)

if optionsErrorString ~= "" then
    print(errorString)
end

-- Keybinds
local builtin = require('telescope.builtin')
local tree = require("nvim-tree.api")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tt', tree.tree.toggle, {})

-- Packer
local packerGetter = require("packer_getter")

local packerOk, packer, bootstrappedPacker = packerGetter()

local usePlugins = require("use_plugins")

if packerOk then
    packer.startup(function(use)
		-- packer is a plugin itself, so it can update itself
		use { 'wbthomason/packer.nvim' }

		usePlugins(use)

		if bootstrappedPacker then
			packer.sync()
		end
	end)
else
    print("Packer could not load!")
end
