local plugins = {

  -- vim tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Copilot
  --[[
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      require("copilot").setup()
    end,
  },
  ]]

  -- get cmp to work with copilot
  --[[
  {
    "hrsh7th/cmp-copilot",
    lazy = true,
  },
  ]]
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      require("copilot").setup()
    end,
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   lazy = true,
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = false},
  --       panel = { enabled = false},
  --     })
  --   end,
  -- },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = "copilot.lua",
  --   opts = {},
  --   config = function ()
  --     local copilot_cmp = require("copilot_cmp")
  --     copilot_cmp.setup(opts)
  --     -- copilot_cmp._on_insert_enter()
  --   end,
  -- },

  -- cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        -- "zbirenbaum/copilot.lua",
        -- "zbirenbaum/copilot-cmp",
        "github/copilot.vim"
      },
    },
    opts = function()
      local conf = require("plugins.configs.cmp")
      conf.sources = {
        {name = "copilot", group_index = 2},
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      }
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        --local line, col = string.unpack(vim.api.nvim_win_get_cursor(0))
        local line = vim.api.nvim_win_get_cursor(0)[1]
        local col = vim.api.nvim_win_get_cursor(0)[2]
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
      end
      conf.mapping = {
        ["<CR>"] = vim.schedule_wrap(function(fallback)
          --local has_words_before = require("custom.configs.cmp").has_words_before()
          if require("cmp").visible() and has_words_before() then
            require("cmp").select_next_item({ behavior = require("cmp").SelectBehavior.Select })
          else
            fallback()
          end
        end),
        ["<CR>"] = require("cmp").mapping.confirm {
          behavior = require("cmp").ConfirmBehavior.Insert,
          select = true,
        },
        ["<Down>"] = require("cmp").mapping(function(fallback)
          if require("cmp").visible() then
            require("cmp").select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
            "i",
            "s",
          }),
        ["<Up>"] = require("cmp").mapping(function(fallback)
          if require("cmp").visible() then
            require("cmp").select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),

      }

      return conf
      --return require("custom.configs.cmp")
    end,
    --config = function(_, opts)
      --require("plugins.configs.cmp")
      --require("custom.configs.cmp")
      --require("cmp").setup(opts)
    --end,
  },

  -- Mason LSP
  {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "bibtex-tidy",
      },
    },
  },

  -- Treesitter
  {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          -- defaults 
          "vim",
          "lua",

          -- python
          "python",

          -- web dev 
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "json",
          -- "vue", "svelte",

         -- low level
          "c",
        },
      },
    },



  -- better comments
  {
    "Djancyp/better-comments.nvim",
    lazy = false,
    config = function()
      require('better-comment').Setup()
    end,
  },


-- doki-theme-vim
  {
    "doki-theme/doki-theme-vim",
    lazy = false,
  },

}

return plugins
