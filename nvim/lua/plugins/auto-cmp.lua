return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim", -- lspkind for better completion menu
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    -- require the lspkind
    local lspkind = require("lspkind")
    -- setting up custom source
    local brony_source = require("cmp-sources.brony")
    cmp.register_source("brony", brony_source)

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- Boilerplate is over, this is the config that needs attention.
      mapping = cmp.mapping.preset.insert({
        -- Following two lines are for making me able to scroll thru pop-up function/whatever documentation when it's selected in completion menu
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- These are must-have lines
        ["<C-e>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort() -- close autocomplete menu
          else
            cmp.complete() -- open autocomplete menu
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true, behaviour = cmp.ConfirmBehavior.Replace }), -- Accept item (pay attention to 'select', if it's set to true, then
        -- even if i dont explicitly type <Tab> to select an item from popup menu, it will select and accept the first item anyway)
        -- cmp.ConfirmBehavior.Replace works like this:
        -- if I have an old variable like twilight_spa, and I place cursor after twilight, select twilight_sparkle from the menu, and confirm, 
        -- it overwrites the rest and becomes twilight_sparkle (instead of twilight_sparkle_spa);

        -- Tab and Shift-Tab to select through options
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- i need to specify from which sources the auto-cmp will grab suggestions
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = "brony" },
        { name = "buffer" }, -- Pulls autocomplete words from active buffers, this is the most basic source
      }),
      -- By default, the custom completion menu's order is top-down; The highest scoring entry appears at the top of the menu. 
      -- However, when in cmdline mode, or when the cursor is near the bottom of the screen, and the menu opens above the cursor, 
      -- it sometimes can be preferable if the menu used a bottom down approach
      -- let's enable that feature:
      view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
      },
      -- lspkind is cool, and it makes the completion menu look better.
      formatting = {
        fields = { 'abbr', 'icon', 'kind', 'menu' },
        format = lspkind.cmp_format({
          show_labelDetails = true,
          menu = { -- i must specify how different sources are displayed
            buffer = "[Buffer]",
            brony = "[Brony]",
            nvim_lsp = "[LSP]",
          }
        }),
      },
    })
  end,
}
