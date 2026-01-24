-- Install all plugins concurrently
vim.pack.add({
  -- Theme
  {
    src = "https://github.com/catppuccin/nvim",
    version = vim.version.range("^1.10")
  },
  -- File Explorer
  {
    src = "https://github.com/stevearc/oil.nvim",
    version = vim.version.range("^2.15")
  },
  -- Syntax Parser
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = vim.version.range("0.10.0"),
  },
  -- Statusline
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  -- Data Repo With LSP Configs
  { src = "https://github.com/neovim/nvim-lspconfig" },
  -- Completion
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("^1.0.0"),
  },
  -- Picker
  -- > shift + tab for help
  { src = "https://github.com/echasnovski/mini.pick" },
  -- Extra Pickers
  { src = "https://github.com/echasnovski/mini.extra" },
  -- Line Moving Utility
  --  > alt + {k, l} current or selected lines
  { src = "https://github.com/echasnovski/mini.move" },
  -- Commenting Utility
  --  > gcc or gc
  { src = "https://github.com/echasnovski/mini.comment" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  -- TODO highlighting
  { src = "https://github.com/folke/todo-comments.nvim" },
})

-- ==============================
-- PLUGIN SETUP
-- ==============================
require("lualine").setup()
require("mini.pick").setup()
require("mini.extra").setup()
require("mini.comment").setup()
require("mini.move").setup()
require("gitsigns").setup({})
require("todo-comments").setup({})

require("oil").setup({
  dim_inactive = {
    enabled = true,
    percentage = 0.10,
  },
  view_options = { show_hidden = true }
})

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
})
vim.cmd.colorscheme("catppuccin")

vim.lsp.enable({
  "lua_ls",
  "bash-language-server",
  "ty",
  "pylsp",
  "gopls",
  "zls",
  "terraformls"
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    -- general
    "vim",
    "vimdoc",
    "markdown",
    "markdown_inline",
    "dockerfile",
    "diff",

    -- programming languages
    "lua",
    "bash",
    "odin",
    "go",
    "python",
    "zig",
    "rust",
    "c",
  },
  auto_install = true,
  highlight = { enable = true },
})

require("blink.cmp").setup({
  signature = { enabled = true },
  completion = {
    ghost_text = {
      enabled = true,
      show_with_menu = false,
    },
    menu = {
      auto_show = false,
    },
  }
})
