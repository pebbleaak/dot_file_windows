-- lua/plugins/python.lua

return {
  -- 1) Python LSP: Pyright
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      opts.servers.pyright = {
        settings = {
          pyright = {
            disableOrganizeImports = true, -- Ruff handles imports if you want
          },
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoImportCompletions = true,
            },
          },
        },
      }
    end,
  },

  -- 2) Ruff diagnostics via nvim-lint
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.python = { "ruff" }
    end,
  },

  -- 3) Formatting via Ruff (and optional Black)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      opts.formatters_by_ft.python = {
        "ruff_fix",
        "ruff_organize_imports",
        "ruff_format",
        -- "black", -- uncomment if you also want Black after Ruff
      }

      -- format on save only for python
      opts.format_on_save = function(bufnr)
        if vim.bo[bufnr].filetype == "python" then
          return { timeout_ms = 1000, lsp_fallback = true }
        end
      end
    end,
  },
}
