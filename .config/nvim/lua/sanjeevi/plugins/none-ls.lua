return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Formatting
				null_ls.builtins.formatting.stylua, -- Lua formatter
				null_ls.builtins.formatting.prettier, -- JavaScript/TypeScript/HTML/CSS formatter
				null_ls.builtins.formatting.rubocop, -- Ruby formatter
				null_ls.builtins.formatting.clang_format, -- C++ formatter
				null_ls.builtins.formatting.google_java_format, -- Java formatter
				null_ls.builtins.formatting.black, -- Python formatter
				null_ls.builtins.formatting.ormolu, -- Haskel formatter

				-- Diagnostics
				null_ls.builtins.diagnostics.erb_lint, -- Ruby diagnostics
				null_ls.builtins.diagnostics.rubocop, -- Ruby diagnostics
				null_ls.builtins.diagnostics.cppcheck, -- C++ diagnostics
			},
		})

		-- Keymap for formatting
		vim.keymap.set("n", "<leader>s", vim.lsp.buf.format, {})
	end,
}
