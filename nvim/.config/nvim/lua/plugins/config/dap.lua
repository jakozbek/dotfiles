-- DAP
local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/local/opt/llvm/bin/lldb-vscode",
	name = "lldb",
}

dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
            -- TODO; make generic
            -- get rust target path for debug
            local blah = string.format("%s/target/debug/keysort", vim.fn.getcwd())
            print(blah)
            return blah
        end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},

		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		-- runInTerminal = false,
	},
}

-- make mapping for breakpoint
-- vim.keymap.set("n", "<leader>gs", ":G<CR>:only<CR>", { desc = "[G]it [S]tatus" })
vim.keymap.set(
	"n",
	"<leader>b",
	':lua require"dap".toggle_breakpoint()<CR>',
	{ desc = "Toggle [b]reakpoint", noremap = true, silent = true }
)

vim.keymap.set("n", "<F5>", dap.continue, { noremap = true, silent = true })
vim.keymap.set("n", "<F10>", dap.step_over, { noremap = true, silent = true })
vim.keymap.set("n", "F11",   "<Cmd>lua dap.step_into()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "F12", "<Cmd>lua dap.step_out()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { noremap = true, silent = true })
-- TODO finish these, leader B, leader lp, leader dr, leader dl
-- vim.keymap.set(
-- 	"n",
-- 	"<Cmd>lua dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
-- 	{ noremap = true, silent = true }
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"<Cmd>lua dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
-- 	{ noremap = true, silent = true }
-- )
-- vim.keymap.set("n", "<Cmd>lua dap.repl.open()<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Cmd>lua dap.run_last()<CR>", { noremap = true, silent = true })
--

-- DAP UI
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
