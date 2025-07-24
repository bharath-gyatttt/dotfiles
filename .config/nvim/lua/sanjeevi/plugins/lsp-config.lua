return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "pyright",
          "rust_analyzer",
          "hls", -- Haskell Language Server
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "j-hui/fidget.nvim",    -- for LSP progress UI
      "hrsh7th/cmp-nvim-lsp", -- for completion capabilities
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- List of language servers with optional settings
      local servers = {
        tsserver = {}, -- correct name is tsserver, not ts_ls
        jdtls = {
          settings = {
            java = {
              format = { enabled = true },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        clangd = {},
        rust_analyzer = {},
        sqlls = {},
        hls = {
          cmd = { vim.fn.exepath("haskell-language-server-wrapper"), "--lsp" },
          filetypes = { "haskell", "lhaskell" },
          root_dir = lspconfig.util.root_pattern(
            "*.cabal",
            "stack.yaml",
            "cabal.project",
            "package.yaml",
            "hie.yaml"
          ),
        },
      }

      -- Setup each server
      for name, config in pairs(servers) do
        config.capabilities = capabilities
        lspconfig[name].setup(config)
      end

      -- Optional: enable fidget.nvim for LSP status UI
      require("fidget").setup({})

      -- Global LSP key mappings
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap.set
      keymap("n", "K", vim.lsp.buf.hover, opts)
      keymap("n", "<leader>gd", vim.lsp.buf.definition, opts)
      keymap("n", "<leader>gr", vim.lsp.buf.references, opts)
      keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
    end,
  }
}
