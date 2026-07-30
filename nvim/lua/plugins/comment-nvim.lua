return {
    -- Cheat sheet for the plugin:
    -- in NORMAL mode:
    -- gcc -> comment out the line
    -- gco -> insert comment below current line and enter INSERT mode
    -- gcO -> insert comment above current line and enter INSERT mode
    -- gcA -> insert comment at the end of the line and enter INSERT mode
    -- gcG -> comment out every single line in the file, starting from the cursor
    -- Block comments:
    -- gbc -> comment out whole block (for languages like java who support multi-line comment wrappers)
    -- VISUAL mode--[[ : ]]
    -- gc -> toggle line comments on entire selected block
    -- gb -> wrap the entire selected block in a multi-line comment wrapper
    'numToStr/Comment.nvim',
    opts = {},
}
