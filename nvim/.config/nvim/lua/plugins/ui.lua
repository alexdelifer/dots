-- Look & feel: Night Owl, statusline, dashboard, notifications, which-key
-- every row is padded to the same width: snacks centres each line on its own
local banner = [[
██████╗ ███████╗██╗     ██╗███████╗███████╗██████╗⠀
██╔══██╗██╔════╝██║     ██║██╔════╝██╔════╝██╔══██╗
██║  ██║█████╗  ██║     ██║█████╗  █████╗  ██████╔╝
██║  ██║██╔══╝  ██║     ██║██╔══╝  ██╔══╝  ██╔══██╗
██████╔╝███████╗███████╗██║██║     ███████╗██║  ██║
╚═════╝ ╚══════╝╚══════╝╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝

Δ  nvim]]

return {
  {
    "oxfist/night-owl.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("night-owl").setup({
        transparent_background = true,   -- let Ghostty's blur show through
        italics = true,
      })
      vim.cmd.colorscheme("night-owl")
      -- Night Owl accents for a few groups the theme leaves plain
      local hl = vim.api.nvim_set_hl
      hl(0, "SnacksDashboardHeader", { fg = "#c792ea" })
      hl(0, "SnacksDashboardIcon", { fg = "#82aaff" })
      hl(0, "SnacksDashboardKey", { fg = "#addb67" })
      hl(0, "SnacksDashboardFooter", { fg = "#637777", italic = true })
      hl(0, "WinSeparator", { fg = "#1d3b53" })
      hl(0, "FloatBorder", { fg = "#5f7e97", bg = "NONE" })
      hl(0, "NormalFloat", { bg = "#011627" })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "night-owl",
        globalstatus = true,
        component_separators = "",
        section_separators = { left = "\u{e0b4}", right = "\u{e0b6}" },
        disabled_filetypes = { statusline = { "snacks_dashboard" } },
      },
      sections = {
        lualine_a = { { "mode", fmt = function(m) return "Δ " .. m end } },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1, symbols = { modified = " ●", readonly = " \u{f023}" } } },
        lualine_x = { "diagnostics", { "lsp_status", icon = "\u{f085}" }, "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  {
    "folke/snacks.nvim",
    priority = 900,
    lazy = false,
    opts = {
      bigfile = { enabled = true },          -- huge logs/dumps open fast
      quickfile = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true, style = "compact" },
      indent = { enabled = true, animate = { enabled = false } },
      words = { enabled = true },            -- highlight other uses of the word under cursor
      statuscolumn = { enabled = true },
      lazygit = { configure = true },
      terminal = { win = { style = "float", border = "rounded" } },
      dashboard = {
        preset = {
          header = banner,
          keys = {
            { icon = "\u{f15b} ", key = "f", desc = "Find file", action = ":FzfLua files" },
            { icon = "\u{f002} ", key = "g", desc = "Grep", action = ":FzfLua live_grep" },
            { icon = "\u{f1da} ", key = "r", desc = "Recent files", action = ":FzfLua oldfiles" },
            { icon = "\u{f07c} ", key = "e", desc = "Explore (oil)", action = ":Oil" },
            { icon = "\u{e702} ", key = "l", desc = "Lazygit", action = function() Snacks.lazygit() end },
            { icon = "\u{f013} ", key = "c", desc = "Config", action = ":FzfLua files cwd=~/.config/nvim" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
            { icon = "\u{f011} ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
    keys = {
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gl", function() Snacks.lazygit.log_file() end, desc = "Lazygit file log" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Open in browser", mode = { "n", "x" } },
      { "<C-/>", function() Snacks.terminal() end, desc = "Terminal", mode = { "n", "t" } },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
      { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notifications" },
      { "<leader>z", function() Snacks.zen() end, desc = "Zen mode" },
      { "<leader>.", function() Snacks.scratch() end, desc = "Scratch buffer" },
      { "]]", function() Snacks.words.jump(1, true) end, desc = "Next reference" },
      { "[[", function() Snacks.words.jump(-1, true) end, desc = "Prev reference" },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      spec = {
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "hunk" },
        { "<leader>R", group = "http (kulala)" },
        { "<leader>u", group = "toggle" },
        { "<leader>x", group = "diagnostics" },
        { "<leader>e", group = "encode", mode = "x" },
        { "<leader>d", group = "decode", mode = "x" },
      },
    },
  },

  { "echasnovski/mini.icons", lazy = true, opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end },
}
