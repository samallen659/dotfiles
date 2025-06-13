return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		local ensure_installed = { "bicep", "lua_ls" }
		mason_lspconfig.setup({
			ensure_installed = ensure_installed,
			automatic_enable = true,
		})

		local check_in_ensure_installed = function(name)
			for _, i in ipairs(ensure_installed) do
				if name == i then
					return true
				end
			end
			return false
		end

		local servers = mason_lspconfig.get_installed_servers()
		for _, server_name in ipairs(servers) do
			if not check_in_ensure_installed(server_name) then
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end
		end

		lspconfig["bicep"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "bicep", "bicepparam" },
			cmd = { "bicep-lsp" },
		})
		-- lspconfig["lua_ls"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	settings = {
		-- 		Lua = {
		-- 			diagnostics = {
		-- 				globals = { "vim" },
		-- 			},
		-- 			workspace = {
		-- 				library = {
		-- 					[vim.fn.expand("VIMRUNTIME/lua")] = true,
		-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						version = "LuaJIT", -- or "Lua 5.1" if that's more accurate for your environment
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "vim" },
						disable = { "lowercase-global" }, -- optional: reduce noise for Neovim scripts
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true), -- picks up everything in runtimepath
						checkThirdParty = false, -- prevents unnecessary prompts about "third-party" libraries
					},
					telemetry = {
						enable = false, -- disable telemetry
					},
					format = {
						enable = true, -- enable formatting using lua_ls (optional)
					},
				},
			},
		})
		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "yaml", "yml" },
			settings = {
				yaml = {
					keyOrdering = false,
					format = {
						enable = true,
					},
					validate = true,
					schemaStore = {
						enable = true,
					},
					schemas = {
						["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
						["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
					},
				},
			},
		})
	end,
}
