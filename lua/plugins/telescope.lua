return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      
      -- Atajos de teclado:
      -- Buscar archivos por nombre (el famoso Ctrl+P)
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Buscar Archivos' })
      -- Buscar una palabra dentro de todos los archivos
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Buscar Texto (Grep)' })
      -- Buscar entre los archivos que tienes abiertos actualmente
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Ver Buffers' })
    end,
  },
}
