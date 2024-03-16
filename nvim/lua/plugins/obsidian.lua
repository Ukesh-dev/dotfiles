return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    keys = {
      -- Obsidian
      { "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", desc = "Obsidian Check Checkbox" },
      { "<leader>ot", "<cmd>ObsidianTemplate<CR>", desc = "Insert Obsidian Template" },
      { "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Open in Obsidian App" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Show ObsidianBacklinks" },
      { "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "Show ObsidianLinks" },
      { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Create New Note" },
      { "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search Obsidian" },
      { "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
    },
    opts = {
      workspaces = {
        {
          name = "ObsidianVault",
          path = "~/Dev/Obsidian/Ukesh/",
        },
      },
      new_notes_location = "current_dir",
      completion = {
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        -- 1. Whether to add the note ID during completion.
        -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
        -- prepend_note_id = true,
        wiki_link_func = true,
      },
      mappings = {},

      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        tags = "",
        substitutions = {
          yesterday = function()
            return os.date("%Y-%m-%d", os.time() - 86400)
          end,
          tomorrow = function()
            return os.date("%Y-%m-%d", os.time() + 86400)
          end,
        },
      },

      ui = {
        enable = true,
      },
    },
  },
}
