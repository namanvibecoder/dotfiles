-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end
  },

   {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        }
      })
    end
  }
})

-- Your basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.signcolumn = "no"
vim.opt.numberwidth = 3
vim.opt.updatetime = 50
vim.opt.laststatus = 3

--Line number colors
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })                       --Normal line
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f9e2af", bold = true })    --Cursor line
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fab387", bold = true })    --cursor

--Running a C file 
vim.api.nvim_create_user_command('RunC', function()
  vim.cmd('w') -- save file
  vim.cmd('!gcc % -o %< && ./%<')  --Compile and run
end, {})
