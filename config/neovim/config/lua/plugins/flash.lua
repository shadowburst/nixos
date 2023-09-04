return {
	{
		"folke/flash.nvim",
		keys = {
			{
				"s",
				mode = { "n", "o", "x" },
				false,
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"*",
				mode = "n",
				function()
					require("flash").jump({
						pattern = vim.fn.expand("<cword>"),
						search = {
							forward = true,
							wrap = false,
						},
						jump = {
							history = true,
							register = true,
							nohlsearch = true,
						},
					})
				end,
			},
			{
				"#",
				mode = "n",
				function()
					require("flash").jump({
						pattern = vim.fn.expand("<cword>"),
						search = {
							forward = false,
							wrap = false,
						},
						jump = {
							history = true,
							register = true,
							nohlsearch = true,
						},
					})
				end,
			},
		},
		opts = {
			modes = {
				search = {
					highlight = {
						backdrop = true,
					},
					search = {
						wrap = false,
						multi_window = false,
					},
				},
			},
		},
	},
}
