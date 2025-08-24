return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false }, -- disable inline suggestions
      panel = { enabled = false },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot-cmp" },
    opts = function(_, opts)
      -- Ensure sources exists
      opts.sources = opts.sources or {}
      table.insert(opts.sources, 1, { name = "copilot" })

      -- Add custom mapping for Copilot accept
      local cmp = require("cmp")
      opts.mapping = opts.mapping or cmp.mapping.preset.insert({})

      opts.mapping["<C-l>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if entry and entry.source.name == "copilot" then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        else
          fallback()
        end
      end, { "i", "s" })
    end,
  },
}

