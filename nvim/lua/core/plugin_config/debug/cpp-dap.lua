local dap = require("dap")

dap.adapters.cpp = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- Adjust to 'gdb', 'gdbserver', etc., if needed
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch executable",
		type = "cpp",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = {},
		-- args = function()
		-- 	local argument_string = vim.fn.input("Program arguments: ")
		-- 	return vim.fn.split(argument_string, " ", true)
		-- end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		runInTerminal = false,
	},
}
dap.configurations.c = dap.configurations.cpp
