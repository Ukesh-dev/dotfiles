-- turn off paste mode when leaving insert

--[[ vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
 ]]
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- this one works not in the keymaps one
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	-- 	-- delay update diagnostics
-- 	update_in_insert = true,
-- })

-- fix concealllevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

-- require("transparent").clear_prefix("lualine")
--

local function run_curr_python_file()
  -- Get file name in the current buffer
  local file_name = vim.api.nvim_buf_get_name(0)

  -- Check if the file has a .py extension
  if file_name:match("%.py$") then
    -- Get terminal codes for running python file
    -- ("i" to enter insert before typing rest of the command)
    local py_cmd = vim.api.nvim_replace_termcodes('python3 "' .. file_name .. '"<cr>', true, false, true)

    local lnrvim_togterm_cmd = vim.api.nvim_replace_termcodes("<leader>ft", true, false, true)

    -- Press keys to launch toggleterm in LunarVim
    vim.api.nvim_feedkeys(lnrvim_togterm_cmd, "m", true)
    -- Press keys to run python command on current file
    vim.api.nvim_feedkeys(py_cmd, "t", false)
  else
    print("Not a Python file.")
  end
end

vim.keymap.set({ "n" }, "<leader>fo", "", {
  desc = "Run .py file via Neovim built-in terminal",
  callback = run_curr_python_file,
})

-- Open files from within the nvim
vim.api.nvim_create_user_command("Rfinder", function()
  local path = vim.api.nvim_buf_get_name(0)
  os.execute("open -R " .. path)
end, {})
