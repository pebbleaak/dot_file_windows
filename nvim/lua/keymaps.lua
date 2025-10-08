-- Save & Quit
--vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
--vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })

-- Window navigation with Ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
-- Window swapping / movement (leader-based, reliable)
vim.keymap.set('n', '<leader>wh', '<C-w>H', { desc = 'Move window to left' })
vim.keymap.set('n', '<leader>wj', '<C-w>J', { desc = 'Move window to bottom' })
vim.keymap.set('n', '<leader>wk', '<C-w>K', { desc = 'Move window to top' })
vim.keymap.set('n', '<leader>wl', '<C-w>L', { desc = 'Move window to right' })
vim.keymap.set('n', '<leader>wr', '<C-w>r', { desc = 'Rotate windows' })


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

-- Telescop
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>',  { desc = 'Grep text' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>',    { desc = 'List buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>',  { desc = 'Help tags' })



-- Open terminal in a horizontal split
vim.keymap.set('n', '<leader>t', ':split term://bash<CR>', { desc = 'Open terminal' })

-- Or open in a vertical split
vim.keymap.set('n', '<leader>vt', ':vsplit term://bash<CR>', { desc = 'Vertical terminal' })

-- Escape terminal mode quickly
--vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode', noremap = true, silent = true })
