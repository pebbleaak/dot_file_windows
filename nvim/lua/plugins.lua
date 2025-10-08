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
},
{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' }
},

{
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 35,
        side = 'left',
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
      },
    }

    vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file explorer' })
  end
},

{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = { theme = 'auto' },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end
}
--{
--  'akinsho/toggleterm.nvim',
 -- version = "*",
--  config = function()
 --   require('toggleterm').setup {
  --    size = 15,
   --   open_mapping = [[<c-\>]],  -- toggle terminal with Ctrl+\
   --   hide_numbers = true,
    --  shade_terminals = true,
    --  shading_factor = 2,
    --  start_in_insert = true,
    --  persist_size = true,
    --  direction = 'horizontal',  -- also supports 'vertical', 'float'
    --  close_on_exit = true,
    --  shell = vim.o.shell,
   -- }

    -- Optional keymaps for floating and vertical terminals
   -- vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = 'Floating terminal' })
   -- vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = 'Vertical terminal' })
 -- end
--}




}
