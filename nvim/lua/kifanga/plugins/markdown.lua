return {
	{
		-- Markdown syntax highlighting
		"plasticboy/vim-markdown",
		ft = { "markdown" },
		config = function()
			vim.g.vim_markdown_folding_disabled = 1
			vim.g.vim_markdown_conceal = 0
			vim.g.vim_markdown_strikethrough = 1
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
		  vim.fn.system("git -C ~/.local/share/nvim/lazy/markdown-preview.nvim restore .")
		  vim.fn.system("cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app && npm install")
		end,
		ft = { "markdown" },
		config = function()
		  vim.g.mkdp_auto_start = 0 -- Start preview manually
		  vim.g.mkdp_open_to_the_world = 0
		  vim.g.mkdp_browser = "" -- Use default browser
		end,
	  },
	  
	{
		-- Better prose editing
		"preservim/vim-pencil",
		ft = { "markdown" },
		config = function()
			vim.cmd("PencilSoft") -- Enable soft line wrapping
		end,
	},
}
