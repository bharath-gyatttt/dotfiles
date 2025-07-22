return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "j-hui/fidget.nvim" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- TypeScript/JavaScript
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			-- Python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- Ruby
			lspconfig.solargraph.setup({
				capabilities = capabilities,
			})

			-- HTML
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- Java
			lspconfig.jdtls.setup({
				capabilities = capabilities,
				settings = {
					java = {
						format = {
							enabled = true,
						},
					},
				},
			})

			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- Tailwind CSS
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			-- C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			-- Rust
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			-- SQL
			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})

			-- Haskell
			lspconfig.hls.setup({
				cmd = { vim.fn.exepath("haskell-language-server-wrapper"), "--lsp" }, -- 👈 your custom HLS binary
				filetypes = { "haskell", "lhaskell" },
				root_dir = lspconfig.util.root_pattern(
					"*.cabal",
					"stack.yaml",
					"cabal.project",
					"package.yaml",
					"hie.yaml"
				),
				capabilities = require("cmp_nvim_lsp").default_capabilities(), -- if you're using nvim-cmp
			})

			-- Global key mappings for LSP functions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
