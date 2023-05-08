--  import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	local wk = require("which-key")

	wk.register({
		l = {
			name = "Lsp",
			f = { "<cmd>Lspsaga lsp_finder<CR>", "Show definition", opts },
			r = { "<cmd>Lspsaga rename<CR>", "Rename", opts },
			D = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show diagnostics for line", opts },
			d = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show diagnostics for cursor", opts },
			a = { "<cmd>Lspsaga code_action<CR>", "See available code actions", opts },
			k = { "<cmd>Lspsaga hover_doc<CR>", "Show hover docs", opts },
			o = { "<cmd>LSoutlineToggle<CR>", "See outline" },
			p = { "<cmd>Lspsaga peek_definition<CR>", "Peek definitions in editable window" },
		},
		g = {
			name = "LSP Goto",
			d = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration", opts },
			i = { "<cmd>lua vim.lsp.buf.implementation()>CR>", "Go to implementation", opts },
			n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Go to next diagnostic buffer", opts },
			p = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Go to prev diagnostic buffer", opts },
		},
	}, { prefix = "<leader>" })
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
