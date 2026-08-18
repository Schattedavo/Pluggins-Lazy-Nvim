return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Para ver iconos de archivos
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        hijack_netrw = true, -- Reemplaza el explorador feo por defecto
      },
    })
    
    -- Creamos el atajo de teclado manualmente aquí para asegurar
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Abrir Explorador" })
  end
}
