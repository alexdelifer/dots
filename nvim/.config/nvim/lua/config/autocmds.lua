local aug = vim.api.nvim_create_augroup("delifer", { clear = true })
local au = vim.api.nvim_create_autocmd

-- Flash the yanked text
au("TextYankPost", { group = aug, callback = function() vim.hl.on_yank({ timeout = 150 }) end })

-- Reopen files where you left off
au("BufReadPost", {
  group = aug,
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lines = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lines and vim.bo[args.buf].filetype ~= "gitcommit" then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Pick up changes made outside nvim
au({ "FocusGained", "TermClose", "TermLeave" }, { group = aug, command = "checktime" })

-- Keep splits even when the terminal resizes
au("VimResized", { group = aug, command = "tabdo wincmd =" })

-- q closes throwaway windows
au("FileType", {
  group = aug,
  pattern = { "help", "qf", "man", "lspinfo", "checkhealth", "notify", "git" },
  callback = function(args)
    vim.bo[args.buf].buflisted = false
    vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = args.buf, silent = true })
  end,
})

-- Prose: wrap + spell for markdown/text/commits (pentest reports)
au("FileType", {
  group = aug,
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})
