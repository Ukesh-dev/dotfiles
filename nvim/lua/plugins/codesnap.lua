return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    keys = { { "<leader>sc", ":Silicon<CR>", desc = "Snapshot Code", mode = "v", silent = true } },
    config = function()
      require("silicon").setup({
        -- Configuration here, or leave empty to use defaults
        font = "MonoLisaVariable Nerd Font=26",
        theme = "Monokai Extended Light",
        -- theme = "Dracula",
        -- background = "#87f",
        background = "#94e2d5",
        -- output = {
        --   path = "/home/krivah/Pictures/Screenshots",
        -- },
        --[[ watermark = {
          text = " @ukeshdev",
        }, ]]
        -- watermark = " @ukesh-dev",
        window_title = function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
        end,
      })
    end,
  },
}
