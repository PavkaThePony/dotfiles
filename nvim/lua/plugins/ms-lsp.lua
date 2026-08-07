-- time to install the lsp thing
return {
  'neovim/nvim-lspconfig', -- this is the dictionary for every single language, i keep it as the main plagin since it contains specific configurations for
  -- practivally every single language in existance. Why dont i do .setup({}) on it? because native nvim lsp api is hardcoded to look into lsp\ directory
  -- for lsp configuration, and that's exactly the place where nvim-lspconfig dumps its configurations. (note: it will search for lsp\ anywhere, literally anywhere)
  dependencies = {
    { 'mason-org/mason.nvim', config = true }, -- mason is an ui for installing any LS. It is gonna install every single ls into its own folder, so nothing polutes
    -- system wide path. It also changes how nvim searches for language servers(it adds its own path)
    { 'mason-org/mason-lspconfig.nvim', config = true }, -- plugin just so all language servers are automatically 
    -- enabled(only those installed by mason)(doesn't call .config() on its own!)
    { 'hrsh7th/cmp-nvim-lsp' } -- this plugin is a list of nvim-cmp capabilities. by default, neovim still has many capabilities for autocomplete, so neovim, when launches
    -- an ls, tells the language server to send extra information in its standard output. but since i have nvim-cmp, i need even more capabilities.
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          }
        }
      }
    })

    vim.lsp.config('*', { capabilities = capabilities }) -- this will be merged with the configs of nvim-lspconfig for every single language.
    -- when i enter a, for example, .py file, nvim sees that i never called vim.lsp.config('pyright') so it goes to lsp\ folder, grabs the config from there,
    -- then merges my capabilities on top of it. It is a lot of internal magic.
    -- this setting will even work for rustacenvim plugin, since neovim will merge this on top of rustacenvim's rust-specific config

    require('mason-lspconfig').setup({}) -- grabs every single server from mason folder and calls vim.lsp.enable() on them so autocmds for filetypes work

    -- KEYMAPS:
    vim.api.nvim_create_autocmd('LspAttach', {
         desc = 'LSP Keymaps',
         callback = function(event)
           -- This table ensures the keymaps work only in the current buffer where lsp was attached
           local opts = { buffer = event.buf }
           -- KD: Show documentation/hover window. Do KD again when docs are opened to jump into them. Use :q to quit. 
           vim.keymap.set('n', 'KD', vim.lsp.buf.hover, opts)

           -- K: Show error/warning/message from LS (in a floating window)
           vim.keymap.set('n', 'K', vim.diagnostic.open_float, opts)

           -- gD: Go to Declaration (for languages that separate declaration definition(mostly only C and C++ with their obscure .h files))
           vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

           -- <leader>rn: Smart Rename (renames variable project-wide aka non-destructive refactoring)
           vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

           -- <leader>a: Code Actions (Triggers automatic fixes suggested by language server)
           vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)

           -- Telecope integrations

           -- gd: Go to Definition 
           vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)

           -- gr: Go to References (Finds every single file using this variable/method)
           vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)

           -- gi: Go to Implementation (finds classes that implement an interface, or in short, hello java!)
           vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)

           -- fs: Find Symbols (opens telescope's lsp_document_symbols to search for different definitions for different keywords or variables or functions
           -- to quickly jump to them)
           vim.keymap.set('n', 'fs', '<cmd>Telescope lsp_document_symbols<cr>', opts)
      end,
    })
  end,
  lazy = false -- i should keep an eye on that vim.lsp.config(*, {capabilities = capabilities}), it must be loaded and since it's located in setup of this plugin,
  -- this plugin must be loaded.
}
