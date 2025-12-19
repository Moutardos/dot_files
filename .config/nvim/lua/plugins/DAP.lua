return
{
	"rcarriga/nvim-dap-ui",
	dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
	config = function ()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({
		})
	-- Automatically open/close dapui
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
		end

	  -- Debug keymaps
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue/Start debugging" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
		vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
		vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last" })
		vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate" })

	  -- DAP UI keymaps
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
		vim.keymap.set("n", "<leader>de", function()
		dapui.eval()
	  end, { desc = "Evaluate expression" })
	end
}
