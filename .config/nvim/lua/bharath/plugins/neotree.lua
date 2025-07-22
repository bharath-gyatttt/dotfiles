return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Keybind to toggle Neo-tree manually
		vim.keymap.set("n", "go", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				hijack_netrw_behavior = "open_default",
			},
      window = {
        position = "right",
      }
		})

		-- Open Neo-tree on startup
		vim.cmd([[autocmd VimEnter * Neotree show]])
	end,
}

