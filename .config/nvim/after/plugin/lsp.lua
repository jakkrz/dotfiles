local lsp_ok, lsp = pcall(require, 'lspconfig')

if lsp_ok then
	local on_attach = function(client, bufnr)
	    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
	    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
	    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
	    vim.keymap.set("n", "ge", vim.lsp.buf.references, {buffer=0})
	    vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer=0})
		-- if client.supports_method('textDocument/formatting') then
		-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		-- 	vim.api.nvim_create_autocmd('BufWritePre', {
		-- 		group = augroup,
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			vim.lsp.buf.formatting_sync()
		-- 		end
		-- 	})
		-- end
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()

	vim.fn.sign_define('DiagnosticSignError', { texthl = 'DiagnosticSignError', text = '', numhl = '' })
	vim.fn.sign_define('DiagnosticSignWarn', { texthl = 'DiagnosticSignWarn', text = '', numhl = '' })
	vim.fn.sign_define('DiagnosticSignHint', { texthl = 'DiagnosticSignHint', text = '', numhl = '' })
	vim.fn.sign_define('DiagnosticSignInfo', { texthl = 'DiagnosticSignInfo', text = '', numhl = '' })

	vim.diagnostic.config {
		virtual_text = true,
		signs = { active = signs },
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = 'minimal',
			source = 'always',
			header = '',
			prefix = '',
			border = 'rounded'
		},
	}

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

	-- servers
	lsp['pyright'].setup {
		on_attach = on_attach,
		capabilities = capabilities
	}

	lsp['bashls'].setup {
		on_attach = on_attach,
		capabilities = capabilities
	}

    require'lspconfig'.rust_analyzer.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end
