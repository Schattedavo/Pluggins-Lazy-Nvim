-- Silenciar avisos de deprecación que bloquean el inicio
vim.g.deprecation_warnings = false
-- Opcional: ocultar errores de plugins que no afectan al uso
vim.opt.shortmess:append("c")
-- Instalar lazy.nvim automáticamente si no está presente
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configurar lazy.nvim para que lea tu carpeta de plugins
require("lazy").setup({
  spec = {
    -- Esto importa todo lo que pusiste en lua/plugins/matrix.lua
    { import = "plugins" },
  },
  rocks = {
    enabled = false,
  },
})
