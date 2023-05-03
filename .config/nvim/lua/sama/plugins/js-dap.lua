local dap = require("dap")

-- dap.set_log_level("TRACE")

-- https://code.visualstudio.com/docs/nodejs/nodejs-debugging#_launch-configuration-attributes
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.api.nvim_command("au FileType dap-repl lua require('dap.ext.autocompl').attach()")

dap.listeners.before["event_loadedSource"]["entropitor"] = function(--[[ _session, _body ]])
	-- ignore
end

local load_launchjs = function()
	require("dap.ext.vscode").load_launchjs()
end
if not pcall(load_launchjs) then
	vim.notify("Failed to parse launch.json", "warn")
end

require("dap-vscode-js").setup({
	debugger_cmd = { "js-debug-adapter" },
	log_file_level = vim.log.levels.TRACE,
	adapters = {
		"pwa-node",
		"pwa-chrome",
		"pwa-msedge",
		"node-terminal",
		"pwa-extensionHost",
	}, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end
