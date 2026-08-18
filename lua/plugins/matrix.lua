return {
	{
		"matrix-tema",
		dir = vim.fn.stdpath("config") .. "/plugins-manuales/matrix-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("matrix")
		end,
	},
	{
		"matrix-lluvia",
		dir = vim.fn.stdpath("config") .. "/plugins-manuales/vimatrix.nvim",
		lazy = false,

		config = function()
			require("vimatrix").setup({})
			vim.api.nvim_create_user_command("Matrix", "VimatrixOpen", {})
			vim.api.nvim_create_user_command("MatrixO", "VimatrixClose", {})
		end,
	},
}
