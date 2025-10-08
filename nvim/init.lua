-- ~/.config/nvim/init.lua

require('settings')

-- bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)



require('lazy').setup('plugins')

require('keymaps')

require('lsp')

require('telescope').setup{
  defaults = {
    layout_config = { prompt_position = "top" },
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
  },
}

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

  -- 👇 Add these two sections here:
  update_focused_file = {
    enable = true,
    update_cwd = true,   -- optional but nice: keeps current dir synced
  },
  actions = {
    open_file = {
      quit_on_open = true,   -- closes the tree when you open a file
    },
  },
}

