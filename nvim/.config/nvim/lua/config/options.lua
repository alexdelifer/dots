local o = vim.opt

-- UI
o.number = true
o.relativenumber = false          -- <leader>ul toggles
o.cursorline = true
o.signcolumn = "yes"
o.termguicolors = true
o.laststatus = 3                  -- one global statusline
o.showmode = false                -- lualine shows the mode
o.title = true
o.winborder = "rounded"           -- rounded borders on every float (0.11+)
o.pumheight = 12
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
o.fillchars = { eob = " ", fold = " ", foldopen = "▾", foldclose = "▸", foldsep = " " }
o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false
o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"
o.shortmess:append({ I = true, c = true, W = true })
o.cmdheight = 1

-- Editing
o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4
o.shiftround = true
o.smartindent = true
o.virtualedit = "block"           -- free cursor in visual-block
o.formatoptions = "jcroqln21"
o.joinspaces = false
o.confirm = true                  -- ask instead of failing on :q with changes

-- Search / substitute
o.ignorecase = true
o.smartcase = true
o.gdefault = true                 -- :s///g by default (add g to toggle back)
o.inccommand = "split"            -- live preview of :s in a split

-- Files
o.undofile = true
o.undolevels = 10000
o.swapfile = false
o.autoread = true
o.updatetime = 250
o.timeoutlen = 300

-- System
o.mouse = "a"
o.clipboard = "unnamedplus"       -- over SSH nvim falls back to OSC 52 automatically
o.shell = vim.fn.exepath("zsh") ~= "" and vim.fn.exepath("zsh") or vim.o.shell

o.wildignore:append({ ".DS_Store", "*.o", "*.obj", "*.pyc", "*/node_modules/*", "*/.git/*" })

-- Folding via treesitter, all open by default (zc/zo/za to use)
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99
o.foldlevelstart = 99

-- Diagnostics
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { spacing = 2, prefix = "●" },
  float = { source = true },
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.INFO] = "»",
      [vim.diagnostic.severity.HINT] = "⚑",
    },
  },
})
