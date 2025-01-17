local function exists(file)
	local ok, _, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	else
		return false
	end
	return ok
end
return {
	exists = exists
}
