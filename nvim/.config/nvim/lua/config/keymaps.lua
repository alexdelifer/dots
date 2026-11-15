-- Core keymaps (plugin keymaps live next to their plugin spec)
local map = vim.keymap.set

-- Your classics
map("i", "jk", "<Esc><Cmd>w<CR>", { desc = "Escape and save" })
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map({ "n", "i", "x" }, "<C-s>", "<Cmd>w<CR><Esc>", { desc = "Save" })
map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Write" })
map("n", "<leader>q", "<Cmd>confirm qa<CR>", { desc = "Quit all" })

-- Keep the cursor centred on big jumps / search hits
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move selected lines, keep selection when indenting
map("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down", silent = true })
map("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up", silent = true })
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Paste over a selection without losing what you yanked
map("x", "<leader>p", [["_dP]], { desc = "Paste, keep register" })

-- Windows (C-h/j/k/l move between vim splits AND tmux panes: vim-tmux-navigator)
map("n", "<leader>-", "<C-w>s", { desc = "Split below" })
map("n", "<leader>|", "<C-w>v", { desc = "Split right" })
map("n", "<C-Up>", "<Cmd>resize +2<CR>")
map("n", "<C-Down>", "<Cmd>resize -2<CR>")
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>")

-- Buffers
map("n", "<S-h>", "<Cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<Cmd>bnext<CR>", { desc = "Next buffer" })

-- Diagnostics
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Toggles
map("n", "<leader>ul", function() vim.wo.relativenumber = not vim.wo.relativenumber end, { desc = "Toggle relative numbers" })
map("n", "<leader>uw", function() vim.wo.wrap = not vim.wo.wrap end, { desc = "Toggle wrap" })
map("n", "<leader>ud", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, { desc = "Toggle diagnostics" })

-- Hacker helpers
map("n", "<leader>cx", "<Cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })
map("x", "<leader>e64", [[c<C-r>=system('base64 | tr -d "\n"', @")<CR><Esc>]], { desc = "Base64 encode selection" })
map("x", "<leader>d64", [[c<C-r>=system('base64 --decode', @")<CR><Esc>]], { desc = "Base64 decode selection" })
-- Strict percent-encoding: everything except A-Z a-z 0-9 - . _ ~ (payload-safe)
_G.url_encode_strict = function(s)
  return (s:gsub("[^%w%-%._~]", function(c) return string.format("%%%02X", c:byte()) end))
end
map("x", "<leader>eu", [[c<C-r>=luaeval('url_encode_strict(_A)', @")<CR><Esc>]], { desc = "URL encode selection" })
map("x", "<leader>du", [[c<C-r>=luaeval('vim.uri_decode(_A)', @")<CR><Esc>]], { desc = "URL decode selection" })
