return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "vtsls" },
      })

      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config("vtsls", {
        cmd = { "vtsls", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        capabilities = capabilities,
        settings = {
          javascript = {
            suggest = { completeFunctionCalls = true },
          },
          typescript = {
            suggest = { completeFunctionCalls = true },
          },
        },
      })

      vim.lsp.enable("vtsls")
    end,
  },
}
