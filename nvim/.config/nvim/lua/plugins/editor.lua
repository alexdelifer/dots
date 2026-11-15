-- Navigation, search, git, editing helpers
return {
  -- fzf everywhere (uses your fzf binary + FZF_DEFAULT_OPTS Night Owl colours)
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = {
      "default-title",
      fzf_colors = true,
      winopts = { height = 0.85, width = 0.85, border = "rounded", preview = { layout = "flex" } },
      files = { cwd_prompt = false },
      grep = { rg_glob = true },               -- live_grep: "foo -- *.py" filters by glob
    },
    config = function(_, opts)
      require("fzf-lua").setup(opts)
      require("fzf-lua").register_ui_select()  -- code actions etc. through fzf
    end,
    keys = {
      { "<C-p>", "<Cmd>FzfLua global<CR>", desc = "Find anything (files, buffers, symbols)" },
      { "<leader><space>", "<Cmd>FzfLua buffers<CR>", desc = "Buffers" },
      { "<leader>pf", "<Cmd>FzfLua files<CR>", desc = "Files" },
      { "<leader>ff", "<Cmd>FzfLua files<CR>", desc = "Files" },
      { "<leader>fg", "<Cmd>FzfLua git_files<CR>", desc = "Git files" },
      { "<leader>fr", "<Cmd>FzfLua oldfiles<CR>", desc = "Recent" },
      { "<leader>/", "<Cmd>FzfLua live_grep<CR>", desc = "Grep" },
      { "<leader>fw", "<Cmd>FzfLua grep_cword<CR>", desc = "Grep word" },
      { "<leader>fw", "<Cmd>FzfLua grep_visual<CR>", desc = "Grep selection", mode = "x" },
      { "<leader>fh", "<Cmd>FzfLua helptags<CR>", desc = "Help" },
      { "<leader>fk", "<Cmd>FzfLua keymaps<CR>", desc = "Keymaps" },
      { "<leader>fc", "<Cmd>FzfLua commands<CR>", desc = "Commands" },
      { "<leader>fd", "<Cmd>FzfLua diagnostics_document<CR>", desc = "Diagnostics" },
      { "<leader>fs", "<Cmd>FzfLua lsp_document_symbols<CR>", desc = "Symbols" },
      { "<leader>fS", "<Cmd>FzfLua lsp_live_workspace_symbols<CR>", desc = "Workspace symbols" },
      { "<leader>f\"", "<Cmd>FzfLua registers<CR>", desc = "Registers" },
      { "<leader>fz", "<Cmd>FzfLua zoxide<CR>", desc = "Zoxide dirs" },
      { "<leader>fR", "<Cmd>FzfLua resume<CR>", desc = "Resume last search" },
      { "<leader>gc", "<Cmd>FzfLua git_commits<CR>", desc = "Commits" },
      { "<leader>gs", "<Cmd>FzfLua git_status<CR>", desc = "Status" },
    },
  },

  -- Edit the filesystem like a buffer (replaces netrw). "-" opens parent dir.
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
      float = { border = "rounded" },
      keymaps = { ["q"] = "actions.close" },
    },
    keys = {
      { "-", "<Cmd>Oil<CR>", desc = "Open parent dir" },
      { "<leader>pv", "<Cmd>Oil<CR>", desc = "Explore (oil)" },
    },
  },

  -- Jump anywhere on screen: s<chars>, S for treesitter nodes
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = { modes = { search = { enabled = false } } },
    keys = {
      { "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash jump" },
      { "S", function() require("flash").treesitter() end, mode = { "n", "o" }, desc = "Flash treesitter" },
    },
  },

  -- Git signs + hunk actions
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame_opts = { delay = 300 },
      on_attach = function(buf)
        local gs = require("gitsigns")
        local function m(lhs, rhs, desc, mode)
          vim.keymap.set(mode or "n", lhs, rhs, { buffer = buf, desc = desc })
        end
        m("]h", function() gs.nav_hunk("next") end, "Next hunk")
        m("[h", function() gs.nav_hunk("prev") end, "Prev hunk")
        m("<leader>hs", gs.stage_hunk, "Stage hunk")
        m("<leader>hr", gs.reset_hunk, "Reset hunk")
        m("<leader>hp", gs.preview_hunk_inline, "Preview hunk")
        m("<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
        m("<leader>hd", gs.diffthis, "Diff this")
        m("<leader>ub", gs.toggle_current_line_blame, "Toggle inline blame")
      end,
    },
  },

  -- Diagnostics / references / quickfix list
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
      { "<leader>xX", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
      { "<leader>xq", "<Cmd>Trouble qflist toggle<CR>", desc = "Quickfix" },
      { "<leader>xt", "<Cmd>Trouble todo toggle<CR>", desc = "TODOs" },
      { "<leader>cs", "<Cmd>Trouble symbols toggle<CR>", desc = "Symbols outline" },
    },
  },

  { "folke/todo-comments.nvim", event = { "BufReadPost", "BufNewFile" }, opts = {},
    keys = { { "<leader>ft", "<Cmd>TodoFzfLua<CR>", desc = "TODOs" } } },

  -- Seamless C-h/j/k/l between nvim splits and tmux panes
  {
    "christoomey/vim-tmux-navigator",
    cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
    keys = {
      { "<C-h>", "<Cmd>TmuxNavigateLeft<CR>" },
      { "<C-j>", "<Cmd>TmuxNavigateDown<CR>" },
      { "<C-k>", "<Cmd>TmuxNavigateUp<CR>" },
      { "<C-l>", "<Cmd>TmuxNavigateRight<CR>" },
    },
  },

  -- mini: surround (vim-surround keys), text objects, pairs, align
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      -- ys{motion}{char}, ds{char}, cs{old}{new}, visual S{char}: same as vim-surround
      require("mini.surround").setup({
        mappings = {
          add = "ys", delete = "ds", replace = "cs",
          find = "", find_left = "", highlight = "", update_n_lines = "",
          suffix_last = "", suffix_next = "",
        },
        search_method = "cover_or_next",
      })
      vim.keymap.del("x", "ys")
      vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true, desc = "Surround" })
      vim.keymap.set("n", "yss", "ys_", { remap = true, desc = "Surround line" })

      require("mini.ai").setup({ n_lines = 500 })   -- va( ci" dif (function) etc.
      require("mini.pairs").setup()
      require("mini.align").setup()                 -- ga / gA (was vim-easy-align)
    end,
  },

  -- Detect indent style per file (random client codebases)
  { "NMAC427/guess-indent.nvim", event = "BufReadPre", opts = {} },
}
