-- Treesitter, LSP (mason), completion (blink), formatting (conform)
local parsers = {
  "bash", "c", "cpp", "c_sharp", "go", "rust", "python", "lua", "luadoc", "vim", "vimdoc", "query",
  "javascript", "typescript", "tsx", "html", "css", "json", "yaml", "toml", "xml", "ini",
  "markdown", "markdown_inline", "sql", "dockerfile", "hcl", "terraform", "make", "cmake",
  "powershell", "php", "java", "ruby", "nix", "regex", "diff", "http",
  "git_config", "gitcommit", "git_rebase", "gitignore", "ssh_config", "asm", "nasm", "zig",
}

local servers = {   -- installed by mason on first start (needs node/python/go on PATH)
  "lua_ls", "basedpyright", "ruff", "bashls", "jsonls", "yamlls", "marksman", "clangd",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(parsers)   -- async; no-op once installed
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("delifer_ts", { clear = true }),
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim", cmd = "Mason", opts = { ui = { border = "rounded" } } },
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function()
      vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
      vim.lsp.config("lua_ls", {
        settings = { Lua = { workspace = { checkThirdParty = false }, telemetry = { enable = false },
          diagnostics = { globals = { "vim", "Snacks" } } } },
      })
      vim.lsp.config("basedpyright", {
        settings = { basedpyright = { analysis = { typeCheckingMode = "standard" } } },
      })
      require("mason-lspconfig").setup({ ensure_installed = servers, automatic_enable = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("delifer_lsp", { clear = true }),
        callback = function(args)
          local function m(lhs, rhs, desc, mode)
            vim.keymap.set(mode or "n", lhs, rhs, { buffer = args.buf, desc = desc })
          end
          -- Built-ins still work: K hover, grn rename, gra action, grr refs, gri impl, gO symbols
          m("gd", "<Cmd>FzfLua lsp_definitions jump1=true<CR>", "Goto definition")
          m("grr", "<Cmd>FzfLua lsp_references jump1=true ignore_current_line=true<CR>", "References")
          m("gI", "<Cmd>FzfLua lsp_implementations jump1=true<CR>", "Implementations")
          m("gy", "<Cmd>FzfLua lsp_typedefs jump1=true<CR>", "Type definition")
          m("<leader>ca", "<Cmd>FzfLua lsp_code_actions<CR>", "Code action", { "n", "x" })
          m("<leader>cr", vim.lsp.buf.rename, "Rename")
          m("<leader>uh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
          end, "Toggle inlay hints")
        end,
      })
    end,
  },

  -- Formatters/linters mason should also install
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    dependencies = { "mason-org/mason.nvim" },
    opts = { ensure_installed = { "stylua", "shfmt", "shellcheck" } },
  },

  {
    "saghen/blink.cmp",
    version = "1.*",              -- prebuilt fuzzy matcher binary
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "super-tab" },   -- Tab accepts / jumps snippets, C-space opens, C-e closes
      appearance = { nerd_font_variant = "mono" },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        menu = { draw = { treesitter = { "lsp" } } },
        ghost_text = { enabled = true },
      },
      signature = { enabled = true },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      cmdline = { completion = { menu = { auto_show = true } } },
    },
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_organize_imports" },
        sh = { "shfmt" }, bash = { "shfmt" }, zsh = { "shfmt" },
        go = { "gofmt" },
        rust = { "rustfmt" },
      },
      default_format_opts = { lsp_format = "fallback" },
      -- Off by default (don't reformat client code by accident); <leader>uf toggles
      format_on_save = function()
        if vim.g.format_on_save then return { timeout_ms = 1000 } end
      end,
    },
    keys = {
      { "<leader>cf", function() require("conform").format({ async = true }) end, mode = { "n", "x" }, desc = "Format" },
      { "<leader>uf", function()
          vim.g.format_on_save = not vim.g.format_on_save
          vim.notify("Format on save: " .. (vim.g.format_on_save and "on" or "off"))
        end, desc = "Toggle format on save" },
    },
  },
}
