
-- For Lua configuration
vim.g.dap_python_executable = '/usr/bin/python' -- Make sure this points to your Python executable
vim.g.dap_python_debugger_path = '/usr/lib/python3.11/site-packages' -- Path to where 'debugpy' is installed


local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = vim.g.dap_python_executable;
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    name = "Python Launch File",
    type = "python",
    request = "launch",
    program = "${file}", -- This will debug the current file
    pythonPath = function()
      return vim.g.dap_python_executable
    end,
  },
}
