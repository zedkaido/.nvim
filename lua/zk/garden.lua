local garden_dir = vim.fn.expand(vim.g.wiki_root)
local link_pattern = "%[%[(.-)%]%]"

function IsDirectory(path)
	local stat = vim.loop.fs_stat(path)
	return stat and stat.type == "directory"
end

function IsSetEmpty(set)
	return next(set) == nil
end

function GetAllLinks()
	local files = vim.fn.readdir(garden_dir)
	local links = {}
	if files then
		for _, fp in ipairs(files) do
			local file_path = garden_dir .. "/" .. fp
			local file = io.open(file_path, "r")
			if (not file) or (IsDirectory(file_path)) then
				goto skip_iteration
			end
			for line in file:lines() do
				for link in line:gmatch(link_pattern) do
					if not links[link] then
						links[link] = true
					end
				end
			end
			::skip_iteration::
			file:close()
		end
	end
	return links
end

function RigrepAllLinks()
	local links = {}
	local handle = io.popen("rg -i -o \"" .. link_pattern .. "\" " .. garden_dir)
	if handle then
		for link in handle:lines() do
			links[link] = true
		end
		handle:close()
	end
	return links
end

function CreateMissingLinks(links)
	for link, _ in pairs(links) do
		local link_file_path = garden_dir .. "/" .. link .. ".md"
		if vim.fn.filereadable(link_file_path) == 0 then
			local link_file = io.open(link_file_path, "w")
			if not link_file then
				goto skip_iteration
			end
			if link_file then
				print("CREATED: " .. link_file_path)
				link_file:write("[[atom]]\n")
				-- link_file:write("# " .. link)
				link_file:close()
			end
			::skip_iteration::
		end
	end
end

function CheckMissingLinks()
	local links = GetAllLinks()
	if not IsSetEmpty(links) then
		CreateMissingLinks(links)
	end
end

vim.cmd([[command! CRM lua CheckMissingLinks()]])

function CreateLocalMissingLinks()
	local file_path = vim.fn.expand("%:p")
	local file = io.open(file_path, "r")
	if not file then
		return
	end
	local links = {}
	for line in file:lines() do
		for link in line:gmatch(link_pattern) do
			if not links[link] then
				links[link] = true
			end
		end
	end
	file:close()
	if not IsSetEmpty(links) then
		CreateMissingLinks(links)
	end
end

vim.cmd([[
	 augroup ZK_Garden
		  autocmd!
		  autocmd BufWritePost ]] .. garden_dir .. [[/*.md lua CreateLocalMissingLinks()
	 augroup END
]])

function SearchBacklinks()
	-- Get the current file name without the ".md" extension
	local file_name = vim.fn.expand("%:t:r")
	local cmd = string.format(
		"rg -i -S -C 1 --heading --type md --sortr modified --json --no-unicode \"\\[\\[%s\\]\\]\" "
		.. garden_dir,
		file_name
	)

	local lines = {}
	local backlinks = vim.fn.system(cmd)
	for line in backlinks:gmatch("[^\r\n]+") do
		table.insert(lines, line)
	end

	vim.cmd("belowright vsplit b:" .. file_name .. "-" .. os.time() .. ".md")
	vim.cmd("setlocal buftype=nofile bufhidden=wipe noswapfile wrap")
	local bufnr = vim.api.nvim_get_current_buf()

	local function append_line(line)
		vim.api.nvim_buf_set_lines(bufnr, -2, -2, false, { line })
	end

	local function pathToLink(path)
		return "[" .. string.match(path, "[^/]+$") .. "]" .. "(file:" .. path .. ")"
	end

	local function cleanUpText(text)
		return text:gsub("[\r\n]", "")
	end

	append_line("== BACKLINKS to [[" .. file_name .. "]] ==")
	append_line("")

	for _, line in ipairs(lines) do
		local ljson = vim.json.decode(line)
		if ljson then
			local ltype = ljson.type
			if ltype then
				if ltype == "begin" then
					append_line(pathToLink(ljson.data.path.text))
					append_line("```txt")
				elseif ltype == "context" then
					append_line(ljson.data.line_number .. ": " .. cleanUpText(ljson.data.lines.text))
				elseif ltype == "match" then
					append_line(ljson.data.line_number .. ": " .. cleanUpText(ljson.data.lines.text))
				elseif ltype == "end" then
					append_line("```")
					append_line("")
				elseif ltype == "summary" then
					append_line("--")
					append_line("TIME: " .. ljson.data.elapsed_total.human)
					append_line("MATCHES: " .. ljson.data.stats.matches)
					append_line("--")
				end
			end
		end
	end
	vim.cmd("setlocal readonly")
	vim.cmd(":1")
end

vim.cmd("command! SearchBacklinks lua SearchBacklinks()")
