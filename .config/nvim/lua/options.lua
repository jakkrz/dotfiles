options = {
	-- line number options
	number = true,
	relativenumber = true,

	-- indentation options
	autoindent = true,
	breakindent = true,
	copyindent = true,
	expandtab = true,
	preserveindent = true,
	smartindent = true,
	smarttab = true,
	shiftwidth = 4,
	tabstop = 4,
	scrolloff = 8,

	-- search options
	hlsearch = false,
	incsearch = true,
	ignorecase = true,
}

local function applyValidOption(name, value)
    vim.o[name] = value
end

function applyOptions(options)
	local errorString = ""

	for option, value in pairs(options) do
		local success, err = pcall(applyValidOption, option, value)

		if not success then
			errorString = errorString..err
		end
	end

	return errorString
end

return {
    options = options,
    applyOptions = applyOptions
}
