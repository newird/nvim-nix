vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"

-- vim.api.nvim_create_autocmd("BufWinLeave", {
--     pattern = "*",
--     callback = function()
--         if vim.fn.exists("b:changedtick") == 1 and vim.fn.filereadable(vim.fn.expand("%")) == 1 then
--             vim.cmd("silent! w")
--         end
--     end
-- })

vim.opt.inccommand = "split"
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = "LspAttach_inlayhints",
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end

		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		require("lsp-inlayhints").on_attach(client, bufnr)
	end,
})
-- for neovide

if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	local alpha = function()
		return string.format("%x", 0.9)
	end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 0.8
	vim.g.transparency = 0.6
	vim.g.neovide_background_color = "#0f1117" .. alpha()
end
--  set opacity
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

-- relevate line
vim.wo.number = true
vim.wo.relativenumber = true

-- undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/vimdid"
vim.opt.undofile = true

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.autochdir = true
-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.scrolloff = 8

vim.cmd([[ set noswapfile ]])

--Line numbers
vim.wo.number = true
