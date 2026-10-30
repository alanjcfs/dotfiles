return {
	"github/copilot.vim",
	cond = function()
		return vim.fn.filereadable(vim.fn.expand("~/.config/github-copilot/apps.json")) == 1
	end,
	init = function()
		vim.g.copilot_filetypes = {
			xml = false,
			markdown = false,
			typst = false,
		}

		-- GitHub Enterprise host, set per machine in ~/.zshrc
		vim.g.copilot_enterprise_uri = vim.env.COPILOT_ENTERPRISE_URI

		-- Prefer nvm's node over system node
		local nvm_dir = vim.env.NVM_DIR
		if nvm_dir then
			local handle = io.popen("ls " .. nvm_dir .. "/versions/node/ 2>/dev/null | sort -V | tail -1")
			if handle then
				local version = vim.trim(handle:read("*l") or "")
				handle:close()
				if version ~= "" then
					local path = nvm_dir .. "/versions/node/" .. version .. "/bin/node"
					if vim.fn.executable(path) == 1 then
						vim.g.copilot_node_command = path
					end
				end
			end
		end
	end
}
