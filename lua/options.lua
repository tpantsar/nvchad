-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

vim.cmd("set expandtab")                    -- Use spaces instead of tabs
vim.cmd("set number relativenumber")        -- Show absolute line number for current line, relative for others
vim.cmd("set cursorline")                   -- Highlight the line where the cursor is
vim.cmd("set hidden")                       -- Allow switching buffers without saving
vim.cmd("set clipboard=unnamedplus")        -- Use system clipboard for all operations
vim.cmd("set tabstop=2")                    -- Number of spaces that a <Tab> in the file counts for
vim.cmd("set softtabstop=2")                -- Number of spaces a <Tab> feels like while editing
vim.cmd("set shiftwidth=2")                 -- Number of spaces to use for autoindent
vim.cmd("set nocompatible")                 -- Disable Vi compatibility (enables many Vim features)
vim.cmd("set hls")                          -- Highlight search results (equivalent to :set hlsearch)

vim.cmd("set termguicolors")                -- Enable true color support
vim.cmd("set signcolumn=yes")               -- Keep signcolumn on to avoid shifting text
vim.cmd("set scrolloff=10")                 -- Minimal number of screen lines to keep above/below cursor
vim.cmd("set sidescrolloff=10")             -- Same for horizontal scrolling
vim.cmd("set laststatus=3")                 -- Global statusline (Neovim only)
vim.cmd("set cmdheight=1")                  -- Set space for the command line

vim.cmd("set smartindent")                  -- Smart auto-indenting
vim.cmd("set updatetime=300")               -- Faster CursorHold events (for plugins like LSP)
vim.cmd("set timeoutlen=500")               -- Shorten mapped key wait time
vim.cmd("set completeopt=menuone,noselect") -- Better completion experience
vim.cmd("set shortmess+=c")                 -- Avoid showing extra messages during completion

vim.cmd("set incsearch")                    -- Show match while typing

-- Leader key is Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basically vim.o allows you to set global vim options, but not local buffer vim options.
-- vim.opt allows a much more expansive API that can handle local and global vim options.
-- https://www.reddit.com/r/neovim/comments/qgwkcu/difference_between_vimo_and_vimopt/?rdt=56644
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.background = "dark"       -- dark, light
vim.opt.ignorecase = true         -- Ignore case in searches
vim.opt.smartcase = true          -- If the search contains uppercase letters, make it case-sensitive
vim.opt.wrap = false              -- Disable line wrapping
vim.opt.swapfile = false          -- Prevents Neovim from creating swap files
vim.opt.clipboard = "unnamedplus" -- Always yank to the system clipboard
vim.opt.autoread = true           -- auto-reload from disk
vim.opt.writeany = true           -- Allow overwriting even if changed outside
vim.opt.backupcopy = "yes"        -- Write directly to the file instead of via temp/rename

vim.scriptencoding = "utf-8"
vim.fileencoding = "utf-8"

-- https://www.youtube.com/watch?v=V070Zmvx9AM&t=154s
vim.opt.encoding = "utf-8"
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Prepends asterisk (*) in block comments
vim.opt.formatoptions:append({ "r" })
