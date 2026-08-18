return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, 
    opts = {
      ensure_installed = { 
        "lua", "vim", "vimdoc", "query", "javascript", "typescript", 
	"tsx", "html", "css", "python", "bash", "markdown" 
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      local status, configs = pcall(require, "nvim-treesitter.configs")
      if not status then
        return
      end
      configs.setup(opts)
    end,
  },
}
