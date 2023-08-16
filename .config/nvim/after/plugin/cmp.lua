local cmp_ok, cmp = pcall(require, 'cmp')

if cmp_ok then
	menu_icons = {
		Text = '',
		Method = '',
		Function = '',
		Constructor = '',
		Field = 'ﰠ',
		Variable = '',
		Class = 'ﴯ',
		Interface = '',
		Module = '',
		Property = 'ﰠ',
		Unit = '塞',
		Value = '',
		Enum = '',
		Keyword = '',
		Snippet = '',
		Color = '',
		File = '',
		Reference = '',
		Folder = '',
		EnumMember = '',
		Constant = '',
		Struct = 'פּ',
		Event = '',
		Operator = '',
		TypeParameter = ''
	}

	cmp.setup {
		mapping = cmp.mapping.preset.insert {
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<Tab>'] = cmp.mapping.confirm({ select = true }),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		},
		formatting = {
			format = function(_entry, vim_item)
				vim_item.kind = (menu_icons[vim_item.kind] or '')
				return vim_item
			end
		},
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'nvim_lsp_signature_help' },
			{ name = 'path' }
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		}
	}
end
