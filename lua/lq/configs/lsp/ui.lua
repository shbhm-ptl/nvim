-- Diagnostic display: custom icons in the sign column + rounded float
-- (uses the modern vim.diagnostic.config API; the old sign_define /
-- signs.active / vim.lsp.with approaches are deprecated in Neovim 0.10+)
vim.diagnostic.config({
	-- disable virtual text
	virtual_text = false,
	-- custom icons in the sign column
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

-- Bordered LSP floats. vim.lsp.with() was removed in favour of passing the
-- window options directly to vim.lsp.buf.hover() / signature_help(), so wrap
-- them once here and every caller (keymaps, plugins) gets the same style.
local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function(opts)
	return hover(vim.tbl_deep_extend("force", { border = "single" }, opts or {}))
end

local signature_help = vim.lsp.buf.signature_help
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function(opts)
	return signature_help(vim.tbl_deep_extend("force", {
		focusable = true,
		style = "minimal",
		border = "rounded",
	}, opts or {}))
end

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
	if msg:match("exit code") then
		return
	end
	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_echo({ { msg } }, true, { err = true })
	else
		vim.api.nvim_echo({ { msg } }, true, {})
	end
end

-- show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
