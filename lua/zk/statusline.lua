local function git_branch()
	local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
	if handle then
		local result = handle:read("*a")
		handle:close()
		return result:gsub("\n", "")
	end
	return ""
end

vim.o.statusline = "[%{mode()}][ETC] %<%f %h%m%r [b:" .. tostring(git_branch()) .. "] %=%-14.(%l,%c%V%) %P %y 笑"
