local status, nvim_dap_ui = pcall(require, "nvim-dap-ui")
if not status then
	return
end

nvim_dap_ui.setup({})
