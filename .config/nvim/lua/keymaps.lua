local map = vim.keymap.set

map("n", "<C-s>", ":write<CR>")
map("n", "qq", ":quit<CR>")

-- open Oil
map("n", "<tab><tab>", "<CMD>Oil<CR>", { desc = "Opens filetree" })

-- Yanking
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')

-- Center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Delete without yanking
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Picker Setup
--   :help MiniPick.builtin
--   :help MiniExtra.pickers
local pick = require("mini.pick")
local extra_pickers = require("mini.extra")
map('n', '<leader>ff', function()
  pick.builtin.cli({
    command = {
      'fd',
      '--type', 'f',
      '--no-ignore',
      '--hidden',
      '--follow',
      '--exclude', '.git',
      '--exclude', 'node_modules',
      '--exclude', 'venv',
      '--exclude', '.venv',
    },
    source = { name = 'All Files' },
  })
end)
map('n', '<leader>fw', pick.builtin.grep_live)
map('n', '<leader>fb', pick.builtin.buffers)
map('n', '<leader>fd', extra_pickers.pickers.diagnostic)
map('n', '<leader>fo', extra_pickers.pickers.oldfiles)
map('n', '<leader>fs', function() extra_pickers.pickers.lsp({scope = "document_symbol"}) end)
map('n', '<leader>f/', extra_pickers.pickers.buf_lines)
map('n', '<leader>fh', pick.builtin.help)

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- LSP keymaps 
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    -- Formatting
    map('n', '<leader>f', vim.lsp.buf.format)

    -- Navigation
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'gs', vim.lsp.buf.declaration, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)

    -- Information
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    -- Code actions
    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    map('n', '<leader>rn', vim.lsp.buf.rename, opts)

    -- Diagnostics
    map('n', '<leader>nd', vim.diagnostic.goto_next, opts)
    map('n', '<leader>pd', vim.diagnostic.goto_prev, opts)
    map('n', '<leader>d', vim.diagnostic.open_float, opts)
    map('n', '<leader>q', vim.diagnostic.setloclist, opts)
  end,
})
