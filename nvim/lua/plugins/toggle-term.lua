return {
  'akinsho/toggleterm.nvim',
  opts = {
    -- I can use 'number<C-t>' to launch or open(if it was already launched) a new terminal. That's how multiple terminals are handled.
    -- For example, I hit <C-t>, it launches term:1, then i hit it again and it hides it. Then i hit 2<C-t>, and it launches a completely
    -- new instance of terminal (term:2), so i will have 2 separate terminals that i can use for different tasks.
    open_mapping = [[<C-t>]],
  },
  lazy = false, -- always have it, must have plugin
}
