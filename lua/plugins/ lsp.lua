return {
  -- 1. El instalador de servidores, linters y formateadores
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- Se carga solo cuando ejecutas :Mason
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        -- Aquí puedes listar programas que no sean servidores LSP
        -- Ejemplo: "stylua", "prettier"
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  -- 2. El puente entre Mason y nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- Servidores que quieres que se instalen automáticamente
      ensure_installed = { 
        "lua_ls",     -- Servidor para Lua (ideal para configurar Neovim)
        -- "ts_ls",   -- Descomenta si usas TypeScript/JavaScript
        -- "pyright",  -- Descomenta si usas Python
      }, 
    },
  },

  -- 3. La configuración base de los servidores LSP en Neovim
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Se carga al abrir un archivo
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- Ya lo tienes instalado
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      
      -- Integra las capacidades de autocompletado de tu nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Atajos de teclado clave cuando el LSP se conecta al archivo activo
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        end,
      })

      -- Configura automáticamente cada servidor instalado por Mason
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
}

