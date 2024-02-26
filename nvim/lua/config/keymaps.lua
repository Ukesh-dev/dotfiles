local nnoremap = require("ukesh.keymaps_utils").nnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- -- When text is wrapped, move by terminal rows, not lines, unless a count is provided
keymap.set("n", "k", "v:count == 0  ? 'gk' : 'k'", { expr = true })
keymap.set("n", "j", "v:count == 0  ? 'gj' : 'j'", { expr = true })

-- -- Reselect visual selection after indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
--
-- -- Maintain the cursor when yanking a visual selection
keymap.set("v", "y", "myy`y")
--
-- -- Disable annoying command line typo
vim.keymap.set("n", "q", ":q")
--
-- -- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Easy insertion of a trailing ; or, from insert mode
keymap.set("i", ";;", "<Esc>A;")
keymap.set("i", ",,", "<Esc>A,")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization
-- general keymaps

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>n", ":nohl<CR>")

keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines when in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "J", "mzJ`z")
-- center after half down
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- Paste replace visual selection without copying it.
vim.keymap.set("v", "p", '"_dP"')

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")

-- Don't turn this on as conform is handling this for us
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- WARN: can cause errors
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- nmap("<BQ>", vim.lsp.buf.signature_help, "Signature Documentation")

-- -- Replace word
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--
vim.keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true })
--
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
--
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Problem Problem Problem including the akinsho bufferline plugin
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
-- nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

vim.api.nvim_set_keymap("n", "<C-a>", ":vertical resize +3<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-x>", ":vertical resize -3<CR>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics i.e open error or warning message
-- keymap.set("n", "<C-j>", function()
-- 	vim.diagnostic.goto_next()
-- end, opts)
-- local butterfish = require("butterfish")

-- Convert the value of hex to hsl:whenever
keymap.set("n", "<leader>r", function()
  require("ukesh.utils").replaceHexWithHSL()
end)

-- Harpoon keybinds --
-- Open harpoon ui
nnoremap("<leader>ho", function()
  harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
nnoremap("<leader>ha", function()
  harpoon_mark.add_file()
end)

-- Remove current file from harpoon
nnoremap("<leader>rh", function()
  harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
nnoremap("<leader>hc", function()
  harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files
nnoremap("<leader>1", function()
  harpoon_ui.nav_file(1)
end)

nnoremap("<leader>2", function()
  harpoon_ui.nav_file(2)
end)

nnoremap("<leader>3", function()
  harpoon_ui.nav_file(3)
end)

nnoremap("<leader>4", function()
  harpoon_ui.nav_file(4)
end)

nnoremap("<leader>5", function()
  harpoon_ui.nav_file(5)
end)

-- Rest Client Keybinds
-- Map <Plug>RestNvim to run the request under the cursor
vim.api.nvim_set_keymap("n", "<leader>xr", "<Plug>RestNvim", { silent = true })

-- Map <Plug>RestNvimPreview to preview the request cURL command
vim.api.nvim_set_keymap("n", "<leader>xp", "<Plug>RestNvimPreview", { silent = true })

-- Map <Plug>RestNvimLast to re-run the last request
vim.api.nvim_set_keymap("n", "<leader>xv", "<Plug>RestNvimLast", { silent = true })
