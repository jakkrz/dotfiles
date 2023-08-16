local ts_ok, ts = pcall(require, 'nvim-treesitter.configs')
if ts_ok then
	ts.setup {
		ensure_installed = 'all',
		ignore_install = { '' },
		highlight = { enable = true },
		autopairs = { enable = false },
		indent = { enable = true }
	}
end

