vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "twilight-sparkle-colorscheme"

-- ---------------------------------------------------------------------
-- Color Palette from Brony Vector Club 
-- ---------------------------------------------------------------------
local twilight = {
  coat_outline       = "#A46BBD",
  coat_fill          = "#CC9CDF",
  coat_shadow_out    = "#9156A9",
  coat_shadow_fill   = "#BF89D1",

  mane_outline       = "#132248",
  mane_fill          = "#243870",
  mane_stripe_1      = "#652D87",
  mane_stripe_2      = "#EA428B",

  iris_gradient_top  = "#1E093C",
  iris_gradient_bot  = "#662F89",
  iris_highlight_top = "#8D5DA4",
  iris_highlight_bot = "#CCB2D3",

  cutie_large_star   = "#EA428B",
  cutie_small_stars  = "#FFFFFF",

  magic_aura         = "#EA428B",
}
-- rainbow dash
local rainbow = {
  coat = {
    outline        = "#6BABDA",
    fill           = "#9BDBF5",
    shadow_outline = "#5C96C9",
    shadow_fill    = "#8CC7E7",
  },

  mane_tail = {
    outline_fill_1 = "#1B98D1", -- Light Blue
    fill_2         = "#EC4141", -- Red
    fill_3         = "#EF7135", -- Orange
    fill_4         = "#FAF5AB", -- Yellow
    fill_5         = "#5FBB4E", -- Green
    fill_6         = "#632E86", -- Purple
  },

  iris = {
    gradient_top      = "#580D36",
    gradient_bottom   = "#BC1D75",
    highlight_top     = "#D9539D",
    highlight_bottom  = "#FC86DF",
  },

  cutie_mark = {
    cloud_outline_blue_streak = "#1B98D1",
    cloud_fill                = "#FFFFFF",
    red_streak                = "#EC4141",
    yellow_streak             = "#FDE85F",
  },
}

-- applejack
local applejack = {
  coat = {
    outline        = "#EF6F2F",
    fill           = "#FABA62",
    shadow_outline = "#E55221",
    shadow_fill    = "#EF9C54",
    freckles       = "#FFFFFF",
  },

  mane_tail = {
    outline = "#E7D462",
    fill    = "#FAF5AB", 
  },

  iris = {
    gradient_top     = "#287916",
    gradient_bottom  = "#61BA4E",
    highlight_top    = "#78D863",
    highlight_bottom = "#CAECC4",
  },

  cutie_mark = {
    apples = "#EC3F41",
    leaves = "#6BB944",
  },

  hat = {
    outline = "#B2884D",
    fill    = "#CA9A56",
  },

  hair_tie = {
    fill = "#EC3F41",
  },
}

-- NON-PONY COLORS
local green 		 = "#00FF00"
local yellow 		 = "#FFD700"
local black              = "#000000"

-- ---------------------------------------------------------
-- Syntax Highlighting 
-- ---------------------------------------------------------
local hl = vim.api.nvim_set_hl
-- Main Workspace UI
hl(0, "Normal",       { fg = twilight.cutie_small_stars, bg = twilight.mane_outline }) -- White text on background 
hl(0, "NormalFloat",  { fg = twilight.coat_fill, bg = twilight.mane_fill })
hl(0, "CursorLine",   { bg = twilight.mane_fill })
hl(0, "Visual",       { bg = twilight.iris_gradient_bot, fg = twilight.cutie_small_stars })

-- Code stuffs
hl(0, "Keyword",      { fg = twilight.mane_stripe_2, bold = true }) -- Pink keywords
hl(0, "Statement",    { fg = twilight.mane_stripe_2, bold = true })
hl(0, "Function",     { fg = twilight.coat_fill, bold = true })    -- Soft functions
hl(0, "String",       { fg = green }) --mane_stripe_2 
hl(0, "Number",       { fg = twilight.mane_stripe_2 })
hl(0, "Boolean",      { fg = twilight.mane_stripe_2, bold = true })
hl(0, "@constant.builtin", { fg = twilight.mane_stripe_2, bold = true })

hl(0, "@variable",    { fg = twilight.cutie_small_stars }) -- Standard text vars are white    
hl(0, "@property",    { fg = twilight.coat_fill })
hl(0, "Operator",      { fg = twilight.mane_stripe_2 })     
hl(0, "Delimiter",     { fg = twilight.coat_outline })      -- Brackets and commas stay framed  

-- Comments should be visible
hl(0, "Comment",      { fg = yellow })

-- popup menus (mainly for completion menu)
hl(0, "Pmenu", { bg = rainbow.coat.fill, fg = rainbow.iris.gradient_top}) -- fg = black
hl(0, "PmenuSel", { bg = twilight.coat_outline, fg = rainbow.coat.fill, bold = true })

-- Sidebar, Line Numbers 
hl(0, "WinSeparator", { fg = twilight.coat_outline })
hl(0, "LineNr",       { fg = twilight.coat_outline })

-- =============================================================================
-- LAZY.NVIM INTERFACE 
-- =============================================================================
hl(0, "LazyNormal",    { fg = twilight.cutie_small_stars, bg = twilight.iris_gradient_top })
hl(0, "LazyBorder",    { fg = twilight.coat_outline })
hl(0, "LazyButton",    { fg = twilight.cutie_small_stars, bg = twilight.mane_fill })
hl(0, "LazyButtonActive", { fg = twilight.cutie_small_stars, bg = twilight.mane_stripe_2, bold = true })
hl(0, "LazyH1",        { fg = twilight.mane_stripe_2, bold = true })
hl(0, "LazyProgressDone", { fg = twilight.mane_stripe_2 })
hl(0, "LazyProgressTodo", { fg = twilight.mane_fill })
-- =============================================================================
-- AUTO-CMP INTERFACE 
-- =============================================================================
-- unmatched letters 
hl(0, "CmpItemAbbr", { fg = rainbow.iris.gradient_top })

-- matched search letters (both fuzzy and not fuzzy)
hl(0, "CmpItemAbbrMatch", { fg = rainbow.mane_tail.fill_2, })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = rainbow.mane_tail.fill_2, })

-- data type descriptions 
hl(0, "CmpItemKind", { fg = rainbow.coat.shadow_outline })
hl(0, "CmpItemKindIcon", { fg = rainbow.coat.shadow_outline })
-- =============================================================================
-- LUALINE INTERFACE -- won't work, and not really worth it. I am fine with nightfly theme, it is pretty decent
-- =============================================================================
