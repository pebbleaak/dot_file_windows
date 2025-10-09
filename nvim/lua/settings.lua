-- ~/.config/nvim/lua/settings.lua


if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.opt.shell = '"C:\\Program Files\\PowerShell\\7\\pwsh.exe"'
 -- vim.opt.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
  vim.opt.shellpipe = '| Out-File -Encoding UTF8 %s'
  vim.opt.shellredir = '| Out-File -Encoding UTF8 %s'
  vim.opt.termguicolors = true
end

-- General settings
vim.opt.breakindent = true
vim.opt.showmode = true
vim.opt.signcolumn = 'yes'

-- Editor Appearance --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.showmatch = true
vim.opt.wrap = true
-- Indentation --
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- Clipboard --
vim.opt.clipboard = 'unnamedplus'

-- Mouse --
vim.opt.mouse = 'a'

-- Search --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- File Handling --
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'
vim.opt.encoding = 'utf-8'
vim.opt.fileformat = 'unix'
-- Performance --
vim.opt.timeoutlen = 500
vim.opt.updatetime = 300

-- Keybindings --
vim.g.mapleader = ' '

-- C/C++ indentation tweaks
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function()
    -- Enable C indentation
    vim.opt_local.cindent = true
    -- Fix continuation indent (no big jump under '(')
    vim.opt_local.cinoptions = "(0"
    -- Your normal 4-space setup
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- Allow Neovim to set terminal/tab title
vim.opt.title = true
vim.opt.titlestring = "%t - nvim"

