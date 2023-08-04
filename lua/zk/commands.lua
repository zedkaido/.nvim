function InsertToday()
	local format = "%Y-%m-%d"
	local date = os.date(format)
	vim.api.nvim_put({ date }, "", true, true)
end

function InsertNow()
	local format = "%H:%M:%S"
	local time = os.date(format)
	vim.api.nvim_put({ time }, "", true, true)
end

function InsertTomorrow()
	local format = "%Y-%m-%d"
	local date = os.date(format, os.time() + 86400)
	vim.api.nvim_put({ date }, "", true, true)
end

vim.cmd([[command! Today lua InsertToday()]])
vim.cmd([[command! Now lua InsertNow()]])
vim.cmd([[command! Tomorrow lua InsertTomorrow()]])
