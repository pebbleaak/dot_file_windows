-- lua/lsp.lua

-- 1️⃣ Mason setup (LSP manager)
require("mason").setup()

-- 2️⃣ Mason-lspconfig: auto-install clangd if missing
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
  automatic_installation = true,
})

-- 3️⃣ Core LSP setup
--local lspconfig = require("lspconfig")

--local capabilities = require("cmp_nvim_lsp").default_capabilities()

--lspconfig.clangd.setup({
 -- cmd = { "clangd", "--background-index", "--clang-tidy" },
 -- filetypes = { "c", "cpp", "objc", "objcpp" },
 -- single_file_support = true,
 -- capabilities = capabilities,
--})
--require("mason-lspconfig").setup_handlers({
--function(server_name)
--    local opts = {}
--
--  if server_name == "clangd" then
--      opts = {
--        cmd = { "clangd", "--background-index", "--clang-tidy" },
--        filetypes = { "c", "cpp", "objc", "objcpp" },
--        single_file_support = true,
--      }
--    end

--  lspconfig[server_name].setup(opts)
 -- end,
--})
--
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  single_file_support = true,
  capabilities = capabilities,
})

-- 4️⃣ Completion setup
local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }),
})

-- Update clangd with capabilities

-- 5️⃣ Signature help
require("lsp_signature").setup({
  bind = true,
  hint_enable = true,
  handler_opts = { border = "rounded" },
})

-- 6️⃣ Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show docs" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

