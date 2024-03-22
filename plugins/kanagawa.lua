return {
  {
    "rebelot/kanagawa.nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- Default options:
      require("kanagawa").setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          return {
            Tag = { link = "Special" },

            -- Markup
            -- ["@markup"] = { fg = C.text }, -- For strings considerated text in a markup language.
            -- ["@markup.strong"] = { fg = C.maroon, style = { "bold" } }, -- bold
            -- ["@markup.italic"] = { fg = C.maroon, style = { "italic" } }, -- italic
            -- ["@markup.strikethrough"] = { fg = C.text, style = { "strikethrough" } }, -- strikethrough text
            -- ["@markup.underline"] = { link = "Underlined" }, -- underlined text
            --
            -- ["@markup.heading"] = { fg = C.blue, style = { "bold" } }, -- titles like: # Example
            --
            -- ["@markup.math"] = { fg = C.blue }, -- math environments (e.g. `$ ... $` in LaTeX)
            -- ["@markup.environment"] = { fg = C.pink }, -- text environments of markup languages
            -- ["@markup.environment.name"] = { fg = C.blue }, -- text indicating the type of an environment

            ["@markup.link"] = { link = "Tag" }, -- text references, footnotes, citations, etc.
            ["@markup.link.url"] = { fg = colors.palette.sakuraPink, italic = true }, -- urls, links and emails

            ["@markup.raw"] = { fg = theme.syn.special1 }, -- used for inline code in markdown and for doc in python (""")

            ["@markup.list"] = { link = "Special" },
            -- ["@markup.list.checked"] = { fg = theme.syn.string }, -- todo notes
            -- ["@markup.list.unchecked"] = { fg = theme.syn.comment }, -- todo notes
          }
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      }
    end,
  },
}
