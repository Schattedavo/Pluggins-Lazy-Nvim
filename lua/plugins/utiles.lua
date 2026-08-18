return {
  -- Cerrar paréntesis automáticamente
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  -- Comentar líneas con gcc
  {
    'numToStr/Comment.nvim',
    config = true
  },
  -- Ayuda para recordar atajos de teclado
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  -- Barra de estado bonita
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true
  }
}
