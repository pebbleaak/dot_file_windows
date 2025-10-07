return {
  -- lazy.nvim can manage itself (optional)
  { "folke/lazy.nvim", lazy = false, priority = 1000 },

  -- C/C++ autoformatter using clang-format
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- lazy-load
    opts = {
      formatters_by_ft = {
        c   = { "clang_format" },
        cpp = { "clang_format" },
        h =   { "clang_format" },
        hpp = { "clang_format" },
        python = { "black" },   
      },
       formatters = {
      black = {
        command = "black",
        args = { "--quiet", "-" }, -- read from stdin
        stdin = true,
      },
    },

      format_on_save = { lsp_fallback = true, timeout_ms = 500 },
    },
    keys = {
      {
        "<leader>f",
        function() require("conform").format({ async = true }) end,
        desc = "Format buffer",
      },
    },
  },

  -- add more plugins below this line
  -- Auto closing Brackets

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },


    -- Themes 
    --
    -- Gruvbox Material
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },

  -- Solarized
  {
    "maxmx03/solarized.nvim",
    lazy = true,
  },

  -- Tokyo Night
  
        {
  "folke/tokyonight.nvim",
  lazy = true,
  --priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon", -- "storm", "night", "moon", "day"
    })
    vim.cmd.colorscheme("tokyonight")
  end,
},


  -- Catppuccin
  --  latte, frappe, macchiato, mocha

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
  --  priority = 1000,
    config = function()
    require("catppuccin").setup({
      flavour = "mocha",     })
 --   Uncomment if you want Catppuccin as default:
     vim.cmd.colorscheme("catppuccin")
  end,
  },
  {
    "rebelot/kanagawa.nvim",
  lazy = true,         -- load on startup
 -- priority = 1000,      -- load before other plugins
  config = function()
    require("kanagawa").setup({
      compile = false,
      theme = "wave", -- options: "wave", "dragon", "lotus"
      background = {  -- map to vim.o.background
        dark = "wave",
        light = "lotus"
      },
    })
    vim.cmd.colorscheme("kanagawa")
  end,

},

-- Core LSP
{
  -- Core LSP
  { "neovim/nvim-lspconfig" },

  -- Mason: portable LSP/DAP installer
  {
    "williamboman/mason.nvim",
    config = true,
  },

  -- Bridge Mason with lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "nvim-lspconfig" },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },

  -- Function signature popups
  { "ray-x/lsp_signature.nvim" },
}
}
