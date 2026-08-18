return {
  -- Pestañas elegantes en la parte superior
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant", -- Estilo de las pestañas (puedes probar "thin" o "thick")
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
        }
      })
    end
  },

  -- Signos de Git en el margen (gutter)
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true, -- Te dice quién escribió la línea (muy útil)
        signcolumn = true,         -- Muestra los símbolos +/-/o al lado de los números
      })
    end
  }
}
