local cmp_ok, cmp = pcall(require, 'cmp')
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#323842" })

if cmp_ok then
    menu_icons = {
		Text = '󰦨',
		Method = '',
		Function = '󰊕',
		Constructor = '',
		Field = '',
		Variable = '󰫧',
		Class = '',
		Interface = '',
		Module = '',
		Property = '',
		Unit = '󰚯',
		Value = '',
		Enum = '',
		Keyword = '',
		Snippet = '',
		Color = '',
		File = '',
		Reference = '',
		Folder = '',
		EnumMember = '',
		Constant = '',
		Struct = 'פּ',
		Event = '',
		Operator = '',
		TypeParameter = '󰉺'
	}

	cmp.setup {
		mapping = cmp.mapping.preset.insert {
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
			['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			    end, { 'i', 's' }),
			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { 'i', 's' })
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
            completion = {
                winhighlight = "Normal:CmpNormal",
            }
        }
		-- window = {
		-- 	documentation = cmp.config.window.bordered(),
		-- }
	}
end
