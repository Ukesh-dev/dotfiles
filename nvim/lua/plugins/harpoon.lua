return {
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    -- branch = "harpoon2",
    --[[ config = function()
      local harpoon = require("harpoon")
      ---@diagnostic disable-next-line: missing-parameter
      harpoon:setup()
      local function map(lhs, rhs, opts)
        vim.keymap.set("n", lhs, rhs, opts or {})
      end
      map("<leader>a", function()
        harpoon:list():append()
      end)
      map("<leader>ho", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      -- map("<c-h><c-h>", function()
      map("<leader>1", function()
        harpoon:list():select(1)
      end)
      map("<leader>2", function()
        harpoon:list():select(2)
      end)
      map("<leader>3", function()
        harpoon:list():select(3)
      end)
      map("<leader>4", function()
        harpoon:list():select(4)
      end)
      map("<leader>5", function()
        harpoon:list():select(5)
      end)
    end, ]]
  },
}
