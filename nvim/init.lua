-- =========================================
-- BOOTSTRAP LAZY.NVIM
-- =========================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- =========================================
-- PLUGINS
-- =========================================

require("lazy").setup({

  -- =====================================
  -- TOKYONIGHT
  -- =====================================

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd.colorscheme("tokyonight-moon")
    end,
  },

  -- =====================================
  -- ALPHA DASHBOARD
  -- =====================================

  {
    "goolord/alpha-nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()

      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- =================================
      -- HEADER
      -- =================================

      dashboard.section.header.val = {

        [[                                                     ]],
        [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        [[                                                     ]],
      }

      -- =================================
      -- BUTTONS
      -- =================================

      dashboard.section.buttons.val = {

        dashboard.button(
          "e",
          "  New File",
          ":ene <BAR> startinsert <CR>"
        ),

        dashboard.button(
          "r",
          "󰊄  Recent Files",
          ":Telescope oldfiles<CR>"
        ),

        dashboard.button(
          "g",
          "󰈬  Find Word",
          ":Telescope live_grep<CR>"
        ),

        dashboard.button(
          "c",
          "  Config",
          ":e ~/.config/nvim/init.lua<CR>"
        ),

        dashboard.button(
          "q",
          "󰅚  Quit",
          ":qa<CR>"
        ),
      }

      -- =================================
      -- FOOTER
      -- =================================

      dashboard.section.footer.val = {

        "",
        "󰣇  Happy Coding",
        "",
      }

      -- =================================
      -- COLORS
      -- =================================

      dashboard.section.header.opts.hl = "Type"
      dashboard.section.buttons.opts.hl = "Keyword"
      dashboard.section.footer.opts.hl = "Comment"

      -- =================================
      -- FINAL SETUP
      -- =================================

      alpha.setup(dashboard.opts)

      vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
      ]])
    end,
  },

  -- =====================================
  -- LUALINE
  -- =====================================

  {
    "nvim-lualine/lualine.nvim",

    config = function()

      require("lualine").setup({

        options = {
          theme = "tokyonight",
          globalstatus = true,
          section_separators = "",
          component_separators = "",
          icons_enabled = true,
        },
      })
    end,
  },

  -- =====================================
  -- TELESCOPE
  -- =====================================

  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()

      require("telescope").setup({

        defaults = {

          border = true,

          borderchars = {

            prompt = {
              "─",
              "│",
              "─",
              "│",
              "┌",
              "┐",
              "┘",
              "└",
            },

            results = {
              "─",
              "│",
              "─",
              "│",
              "┌",
              "┐",
              "┘",
              "└",
            },

            preview = {
              "─",
              "│",
              "─",
              "│",
              "┌",
              "┐",
              "┘",
              "└",
            },
          },
        },
      })
    end,
  },

  -- =====================================
  -- TREESITTER
  -- =====================================

  {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    config = function()

      local ok, configs = pcall(require, "nvim-treesitter.configs")

      if not ok then
        return
      end

      configs.setup({

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
        },
      })
    end,
  },

  {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
    char = "│",
    },
    scope = {
      enabled = true,
    },
  },
},

  -- =====================================
  -- LSP
  -- =====================================

  {
    "neovim/nvim-lspconfig",
  },

})

-- =========================================
-- BASIC SETTINGS
-- =========================================

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.updatetime = 50

vim.opt.laststatus = 3

vim.opt.cursorline = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.numberwidth = 3

-- =========================================
-- BLOCK CURSOR
-- =========================================

vim.opt.guicursor =
"n-v-c:block,i-ci-ve:block-blinkwait300-blinkon200-blinkoff150,r-cr:block,o:block"

-- =========================================
-- TRANSPARENCY
-- =========================================

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE
  highlight EndOfBuffer guibg=NONE
]])

-- =========================================
-- LINE NUMBER COLORS
-- =========================================

vim.api.nvim_set_hl(0, "LineNr", {
  fg = "#7aa2f7"
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#7dcfff",
  bold = true
})

-- =========================================
-- TELESCOPE KEYMAPS
-- =========================================

local builtin = require("telescope.builtin")

--vim.keymap.set("n", "<C-p>", builtin.find_files)
vim.keymap.set("n", "<C-p>", function()
  require("telescope.builtin").find_files({
    hidden = true,
    no_ignore = true,
  })
end, { desc = "Find All Files" })

vim.keymap.set("n", "<leader>fg", builtin.live_grep)

vim.keymap.set("n", "<leader>fr", builtin.oldfiles)

-- =========================================
-- LSP
-- =========================================

vim.lsp.enable("clangd")

vim.diagnostic.config({

  underline = true,

  virtual_text = false,

  signs = true,
})

-- =========================================
-- RUN C FILE
-- =========================================

vim.api.nvim_create_user_command("RunC", function()

  vim.cmd("w")

  vim.cmd("!gcc % -o %< && ./%<")

end, {})
