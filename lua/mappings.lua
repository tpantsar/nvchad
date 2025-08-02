-- https://github.com/JazzyGrim/dotfiles/blob/master/.config/nvim/lua/config/keymaps.lua
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { noremap = true, silent = true }, { desc = desc }))
end

keymap.set("n", "x", '"_x')

-- Substitution
keymap.set("n", "gs", ":%s~~", opts)
keymap.set("v", "gs", ":%s~~", opts)
keymap.set("n", "gS", [[:%s///gc<Left><Left><Left><Left>]], { desc = "Replace in buffer with confirm" })

-- map("n", "<leader>s", [[:%s///gc<Left><Left><Left>]], "Substitute in entire buffer")
-- map("v", "<leader>s", [[:<C-u>s///g<Left><Left>]], "Substitute in visual selection")
-- keymap.set("n", "gs", "zyiw:s/<C-r>z//g<Left><Left>", opts)
-- keymap.set("n", "gS", "zyiw:%s/<C-r>z//gc<Left><Left><Left>", opts)
-- keymap.set("v", "gs", "zy:s/<C-r>z//g<Left><Left>", opts)

-- Increment/decrement
-- keymap.set("n", "+", "<C-a>")
-- keymap.set("n", "-", "<C-x>")
keymap.set("n", "<C-a>", "ggVG", opts)   -- Select all text
keymap.set("n", "<leader>A", "VG", opts) -- Select all text from current line to end of file

-- Files
keymap.set("n", "<C-w>", ":w<CR>", opts)          -- Save in normal mode
keymap.set("i", "<C-w>", "<Esc>:w<CR>", opts)     -- Save in insert mode
keymap.set("n", "<leader>wq", ":wq<CR>", opts)    -- Write and quit
keymap.set("n", "<leader>wQ", ":wqa<CR>", opts)   -- Write all windows and quit
keymap.set("n", "QQ", ":q!<CR>", opts)            -- Quit window without saving
keymap.set("n", "<leader>QQ", ":qa!<CR>", opts)   -- Quit all windows without saving
keymap.set("n", "<leader>q", ":q<CR>", opts)      -- Quit current window
keymap.set("n", "<leader>Q", ":qa<CR>", opts)     -- Quit all windows
keymap.set("n", "E", "$", opts)                   -- Go to end of line
keymap.set("n", "B", "^", opts)                   -- Go to beginning of line
keymap.set("n", "<leader>p", "mzA<Esc>p`z", opts) -- Paste at end of line
keymap.set("n", "ye", "y$", opts)                 -- Yank a text to the end of line

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "tw", ":tabclose<CR>", opts)

-- Buffers
keymap.set("n", "<Tab>", ":bnext<CR>", opts)   -- Next buffer
keymap.set("n", "<C-Tab>", ":bnext<CR>", opts) -- Next buffer
keymap.set("n", "<S-Tab>", ":bprev<CR>", opts) -- Previous buffer
keymap.set("n", "<leader>bd", ":bd<CR>", opts) -- Close buffer

-- Split window
keymap.set("n", "ss", ":vsplit<CR>", opts)
keymap.set("n", "sv", ":split<CR>", opts)

-- Move between windows
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Always keep the cursor centered when searching in Neovim
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)
keymap.set("n", "*", "*zzzv", opts)
keymap.set("n", "#", "#zzzv", opts)
keymap.set("n", "g*", "g*zzzv", opts)
keymap.set("n", "g#", "g#zzzv", opts)

-- Navigate back and forward in the jumplist using Alt+h/l or Alt+i/o
keymap.set("n", "<M-h>", "<C-o>", opts)      -- Previous position
keymap.set("n", "<M-l>", "<C-i>", opts)      -- Next position
keymap.set("n", "<M-i>", "<C-o>", opts)      -- Previous position
keymap.set("n", "<M-o>", "<C-i>", opts)      -- Next position

keymap.set("n", "<C-f>", "/", opts)          -- Forward search
keymap.set("n", "<C-b>", "?", opts)          -- Backwards search

keymap.set("n", "<A-k>", ":m .-2<CR>", opts) -- Move line up
keymap.set("n", "<A-j>", ":m .+1<CR>", opts) -- Move line down

-- Move selection up and down
keymap.set("v", "<A-k>", ":m '<-2<CR>gv", opts) -- Move up without re-indenting
keymap.set("v", "<A-j>", ":m '>+1<CR>gv", opts) -- Move down without re-indenting

-- Clear highlights on search when pressing <Esc> in normal mode, see `:help hlsearch`
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Cut selected text without copying it to the default register (black hole register)
keymap.set("v", "<leader>d", '"_d', opts)

keymap.set("v", "<leader>y", '"+y', opts) -- Copy to clipboard
keymap.set("n", "<leader>P", '"+P', opts) -- Paste before cursor
-- keymap.set("n", "<leader>p", '"+p', opts) -- Paste from clipboard

keymap.set("n", "<leader>ff", function()
  require("favlist"):pick()
end, { desc = "Pick from favlist" })

keymap.set("n", "<leader>o", function()
  require("favlist"):pick()
end, { desc = "Pick from favlist" })

keymap.set("n", "<leader>S", function()
  require("favlist"):save()
end, { desc = "Save to favlist" })

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- nvimtree
keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
