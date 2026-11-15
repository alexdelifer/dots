-- ┌──────────────────────────────────────────────────────────┐
-- │ nvim: Night Owl. Stow package `nvim` → ~/.config/nvim/   │
-- │ Plugins: lazy.nvim (:Lazy). LSP servers: mason (:Mason). │
-- │ Leader = <Space>. Press it and wait: which-key shows all. │
-- └──────────────────────────────────────────────────────────┘

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
