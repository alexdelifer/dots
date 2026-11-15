-- Pentest / hacking quality of life
return {
  -- Report writing: rendered headings, tables, checkboxes, code blocks in markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = { completions = { blink = { enabled = true } } },
    keys = { { "<leader>um", "<Cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render" } },
  },

  -- Hex view/edit binaries via xxd: :HexToggle
  {
    "RaafatTurki/hex.nvim",
    cmd = { "HexToggle", "HexDump", "HexAssemble" },
    opts = {},
    keys = { { "<leader>cH", "<Cmd>HexToggle<CR>", desc = "Hex view toggle" } },
  },

  -- .http files: a Burp-Repeater-ish request runner in the editor
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = { global_keymaps = false },
    keys = {
      { "<leader>Rs", function() require("kulala").run() end, desc = "Send request", ft = { "http", "rest" } },
      { "<leader>Ra", function() require("kulala").run_all() end, desc = "Send all", ft = { "http", "rest" } },
      { "<leader>Rr", function() require("kulala").replay() end, desc = "Replay last", ft = { "http", "rest" } },
      { "<leader>Rc", function() require("kulala").copy() end, desc = "Copy as curl", ft = { "http", "rest" } },
      { "<leader>Ri", function() require("kulala").from_curl() end, desc = "Paste curl as request", ft = { "http", "rest" } },
    },
  },
}
