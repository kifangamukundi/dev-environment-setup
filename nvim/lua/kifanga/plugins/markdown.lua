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
		-- Live Markdown preview with lazy loading
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end, -- Use this if you prefer the lightweight approach without `yarn` or `npm`
		-- Uncomment the below if you prefer using `yarn` or `npm`
		-- build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_auto_start = 0 -- Start preview manually
			vim.g.mkdp_open_to_the_world = 0
			vim.g.mkdp_browser = "" -- Use default browser
		end,
		ft = { "markdown" },
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
