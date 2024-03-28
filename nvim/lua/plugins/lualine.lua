local colors = {
  darkgray = "#16161d",
  gray = "#A8B1D6",
  innerbg = nil,
  outerbg = "#16161D",
  normal = "#7e9cd8",
  insert = "#98bb6c",
  visual = "#ffa066",
  replace = "#e46876",
  command = "#e6c384",
}
return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "arkav/lualine-lsp-progress",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local harpoon = require("harpoon.mark")
      local function harpoon_component()
        local total_marks = harpoon.get_length()

        if total_marks == 0 then
          return ""
        end

        local current_mark = "—"

        local mark_idx = harpoon.get_current_index()
        if mark_idx ~= nil then
          current_mark = tostring(mark_idx)
        end

        return string.format("󱡅 %s/%d", current_mark, total_marks)
      end
      require("lualine").setup({
        options = {
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          -- component_separators = "",
          globalstatus = true,
          -- theme = "auto",
          -- theme = "solarized_dark",
          -- theme = "ayu_mirage",
          -- theme = "catppuccino",
          -- theme = "ayu_mirage",
          -- theme = require("ukesh.theme").theme(),
          theme = {
            inactive = {
              a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
              b = { fg = colors.gray, bg = colors.innerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
              x = { fg = colors.gray, bg = colors.innerbg },
              y = { fg = colors.gray, bg = colors.innerbg },
            },
            visual = {
              a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
              b = { fg = colors.gray, bg = colors.innerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
              x = { fg = colors.gray, bg = colors.innerbg },
              y = { fg = colors.gray, bg = colors.innerbg },
            },
            replace = {
              a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
              b = { fg = colors.gray, bg = colors.innerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
              x = { fg = colors.gray, bg = colors.innerbg },
              y = { fg = colors.gray, bg = colors.innerbg },
            },
            normal = {
              a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
              b = { fg = colors.gray, bg = colors.innerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
              x = { fg = colors.gray, bg = colors.innerbg },
              y = { fg = colors.gray, bg = colors.innerbg },
            },
            insert = {
              a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
              b = { fg = colors.gray, bg = colors.innerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
              x = { fg = colors.gray, bg = colors.innerbg },
              y = { fg = colors.gray, bg = colors.innerbg },
            },
            command = {
              a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
              b = { fg = colors.gray, bg = colors.innerbg },
              c = { fg = colors.gray, bg = colors.innerbg },
              x = { fg = colors.gray, bg = colors.innerbg },
              y = { fg = colors.gray, bg = colors.innerbg },
            },
          },
        },

        sections = {
          lualine_a = {
            "mode",
          },
          lualine_b = {
            "branch",
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
            },
            harpoon_component,
            function()
              return "󰅭 " .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) or "")
            end,
            { "diagnostics", sources = { "nvim_diagnostic" } },
          },
          lualine_c = {
            "filename",
          },
          lualine_x = {
            {
              "rest",
              icon = "",
              fg = "#428890",
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = "#ff9e64" },
            },
          },
          lualine_y = {
            "filetype",
            "encoding",
            "fileformat",
            '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
          },
          lualine_z = {
            "searchcount",
            "selectioncount",
            "location",
            "progress",
          },
        },
      })
    end,
  },
}
