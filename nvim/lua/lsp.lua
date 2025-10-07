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
    -- "--completion-style=detailed",
--    "--all-scopes-completion=false",
  --  "--header-insertion=never",
   -- "--limit-results=50",
  cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--all-scopes-completion=false", "--header-insertion=never", "--limit-results=50" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  single_file_support = true,
  capabilities = capabilities,
})

-- 4️⃣ Completion setup
local cmp = require("cmp")

cmp.setup({
 -- completion = {autocomplete = false},
  performance = {
    max_view_entries = 10,  -- new in cmp 0.10+, limits visible items
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-y>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  --  { name = "buffer" },
   -- { name = "path" },
  }),
})

-- Update clangd with capabilities

-- 5️⃣ Signature help
require("lsp_signature").setup({
  bind = true,
  hint_enable = true,
  handler_opts = { border = "rounded" },
})

