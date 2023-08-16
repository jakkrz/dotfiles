local packerPath = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function isPackerInstalled()
    return vim.fn.empty(vim.fn.glob(packerPath)) == 0
end

local function bootstrapPacker()
	vim.fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		packerPath
	}

	print "Installing packer...\nclose and reopen neovim after the installation has finished."

	vim.cmd [[packadd packer.nvim]]
end

local function getPacker()
    local bootstrappedPacker = false

    if not isPackerInstalled() then
        bootstrapPacker()
        bootstrappedPacker = true
    end

    local packerOk, packer = pcall(require, "packer")

    return packerOk, packer, bootstrappedPacker 
end

return getPacker
