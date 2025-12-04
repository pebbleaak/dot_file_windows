-- lua/plugins/python.lua
-- Perfect Python setup for LazyVim:
-- - Pyright (type checking, hover, completions)
-- - Ruff LSP (fast linting, code actions)
-- - Ruff CLI via nvim-lint (diagnostics)
-- - Ruff formatting + fixes + optional Black (format on save)

return {
  ---------------------------------------------------------------------------
  -- LSP: pyright + ruff
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      -- PYRIGHT: main type checker / hover / completions
      opts.servers.pyright = vim.tbl_deep_extend("force", opts.servers.pyright or {}, {
        settings = {
          pyright = {
            disableOrganizeImports = true, -- Ruff handles imports
          },
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoImportCompletions = true,
            },
          },
        },
      })

      -- RUFF LSP (linting, quick fixes, code actions)
      opts.servers.ruff = {
        init_options = {
          settings = { logLevel = "warning" },
        },
      }
    end,
  },

  ---------------------------------------------------------------------------
  -- Ruff CLI diagnostics (nvim-lint)
  ---------------------------------------------------------------------------
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.python = { "ruff" }
    end,
  },

  ---------------------------------------------------------------------------
  -- Formatting (Ruff + optional Black) + FORMAT ON SAVE
  ---------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Python formatter chain:
      opts.formatters_by_ft.python = {
        "ruff_fix",             -- ruff check --fix
        "ruff_organize_imports",-- import sorting
        "ruff_format",          -- ruff format
        -- "black",              -- optional final pass
      }

      ---------------------------------------------------------------------
      -- ENABLE FORMAT ON SAVE FOR PYTHON ONLY
      ---------------------------------------------------------------------
      opts.format_on_save = opts.format_on_save or {}
      opts.format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,

        -- Run only for python files
        formatters = {
          python = {
            "ruff_fix",
            "ruff_organize_imports",
            "ruff_format",
            -- "black",          -- enable if desired
          },
        },
      }
    end,
  },
}
