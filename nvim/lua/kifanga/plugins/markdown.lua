return {
	{
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
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"preservim/vim-pencil",
		ft = { "markdown" },
		config = function()
			vim.cmd("PencilSoft")
		end,
	},
}
