-- Save & Quit
--vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
--vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })

-- Window navigation with Ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })


-- Insert blank line below (stay in Normal mode)
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Add blank line below" })

-- Insert blank line above (stay in Normal mode)
--vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Add blank line above" })

-- Format current file with Black
vim.keymap.set("n", "<leader>f", ":!black %<CR>", { noremap = true, silent = true })


-- Run current Python file using system python or venv
vim.keymap.set("n", "<leader>r", ":!python %<CR>", { noremap = true, silent = false })



-- 6️⃣ Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show docs" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

