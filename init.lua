return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "kanagawa",
  -- colorscheme = "everforest",
  -- colorscheme = "default",
  -- colorscheme = "habamax",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- use GitBash
    -- vim.cmd [[let &shell = '"C:\Program Files\Git\bin\bash.exe"']]
    -- vim.cmd [[let &shellcmdflag = '-s']]

    -- Set up custom filetypes
    vim.filetype.add {
      -- extension = {
      --   foo = "fooscript",
      -- },
      filename = {
        [".env"] = "text",
      },
      -- pattern = {
      --   ["~/%.config/foo/.*"] = "fooscript",
      -- },
    }

    -- only for Neovide
    if vim.g.neovide then
      vim.o.guifont = "CaskaydiaCove Nerd Font:h12"
      vim.g.neovide_scale_factor = 1.0
      vim.cmd "colorscheme kanagawa"

      -- scale with CTRL-+/-
      local change_scale_factor = function(delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta end
      vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.1) end, { desc = "Zoom in" })
      vim.keymap.set("n", "<C-->", function() change_scale_factor(1 / 1.1) end, { desc = "Zoom out" })

      -- allow CTRL-C copy and CTRL-V paste
      vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy" }) -- Copy
      vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste" }) -- Paste normal mode
      vim.keymap.set("v", "<C-v>", '"+P', { desc = "Paste" }) -- Paste visual mode
      vim.keymap.set("c", "<C-v>", "<C-r>+") -- Paste command mode
      vim.keymap.set("i", "<C-v>", "<C-r>+") -- Paste insert mode
      vim.keymap.set("t", "<C-v>", [[<C-\><C-n>"+Pi]]) -- Paste terminal mode
    end
  end,
}
