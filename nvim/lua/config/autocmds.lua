-- turn off paste mode when leaving insert

--[[ vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
 ]]
vim.api.nvim_create_autocmd("InsertLeave", {
  desc = "Insert leave",
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
    vim.wo.conceallevel = 2
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

--- lazyGit config
-- local Util = require("lazyvim.util")

-- Function to check clipboard with retries
-- local function getRelativeFilepath(retries, delay)
--   local relative_filepath
--   for i = 1, retries do
--     relative_filepath = vim.fn.getreg("+")
--     if relative_filepath ~= "" then
--       return relative_filepath -- Return filepath if clipboard is not empty
--     end
--     vim.loop.sleep(delay) -- Wait before retrying
--   end
--   return nil -- Return nil if clipboard is still empty after retries
-- end

-- Function to handle editing from Lazygit
-- function LazygitEdit(original_buffer)
--   local current_bufnr = vim.fn.bufnr("%")
--   local channel_id = vim.fn.getbufvar(current_bufnr, "terminal_job_id")
--
--   if not channel_id then
--     vim.notify("No terminal job ID found.", vim.log.levels.ERROR)
--     return
--   end
--
--   vim.fn.chansend(channel_id, "\15") -- \15 is <c-o>
--   vim.cmd("close") -- Close Lazygit
--
--   local relative_filepath = getRelativeFilepath(5, 50)
--   if not relative_filepath then
--     vim.notify("Clipboard is empty or invalid.", vim.log.levels.ERROR)
--     return
--   end
--
--   local winid = vim.fn.bufwinid(original_buffer)
--
--   if winid == -1 then
--     vim.notify("Could not find the original window.", vim.log.levels.ERROR)
--     return
--   end
--
--   vim.fn.win_gotoid(winid)
--   vim.cmd("e " .. relative_filepath)
-- end
--
-- -- Function to start Lazygit in a floating terminal
-- function StartLazygit()
--   local current_buffer = vim.api.nvim_get_current_buf()
--   local float_term = Util.terminal.open({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
--
--   vim.api.nvim_buf_set_keymap(
--     float_term.buf,
--     "t",
--     "<c-a>",
--     string.format([[<Cmd>lua LazygitEdit(%d)<CR>]], current_buffer),
--     { noremap = true, silent = true }
--   )
-- end
--
-- vim.api.nvim_set_keymap("n", "<leader>gg", [[<Cmd>lua StartLazygit()<CR>]], { noremap = true, silent = true })
