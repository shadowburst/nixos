return {
	{
		"sindrets/diffview.nvim",
		opts = {
			keymaps = {
				file_panel = {
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
				},
			},
		},
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen -- %:p <cr>", desc = "Diff this buffer" },
			{ "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diff this repository" },
		},
	},
}
