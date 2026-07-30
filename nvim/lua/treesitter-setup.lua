local autocmd = vim.api.nvim_create_autocmd

-- languages which i have a parser and a query for:
local language_filetype_list = { "c", "lua", "vim", "markdown", "json", "rust", }

-- the autocmd to launch the treesitter:
autocmd({ "FileType" }, {
  pattern = language_filetype_list,
  callback = function()
    local lang = vim.bo.filetype
    local has_parser = pcall(vim.treesitter.get_parser, 0, lang)
    
    if has_parser then
      vim.treesitter.start()
    end
    if not has_parser then
      vim.notify("Cannot start Treesitter for current buffer", vim.log.levels.INFO)
    end
  end,
})
-- ========================================================================================
-- Important Information on how I install parsers for languages and make highlighting work
-- ========================================================================================
--
-- Anytime I open a file, Neovim decodes all bytes from it to a Buffer. Then, FileType event is fired. Autocommand sees
-- that the pattern matches the needed language(for example 'lua', 'json') and calls the callback. The callback starts the
-- native treesitter engine (built into neovim), and then treesitter starts doing its job.
--
-- Let's say that the file I opened is 'json' FileType. In that case, Treesitter is gonna look for a json.so library file.
-- it will try to find it in runtimepath of nvim which is \parser\[lang_name].so , after finding it, treesitter is gonna execute it.
-- The json.so is a standalone program whose job is to build Abstract Syntax Tree of json language. It builds the tree using the data
-- that neovim sends to it(the text from the buffer you are typing in), nothing more.
--
-- Then, the second very important part are queries. Queries are instructions to read the Abstract Syntax Tree and for Treesitter to slap 
-- structural labels (like @property, @string, or @number) onto AST nodes (the extension is .scm, it is a Lisp-like language of treesitter)
-- (runtimepath is \queries\lang_name\highlights.scm). They act as the middleman between the AST and Neovim that Treesitter uses to make
-- the tree understandable for Neovim highlighting engine.
--
-- Finally, Neovim's internal highlighting engine breaks in. It takes these labeled nodes, looks up for the current colorscheme file 
-- (e.g. twilight-sparkle-colorscheme.lua), and matches those text labels to provided hex colors. It then colors the 
-- words directly to my terminal screen, updating incrementally.
-- 
-- ===========================================================================
-- So what do you need to install a new language for cool syntax highlighting?
-- ===========================================================================
-- You need to: 
-- 1. Go to the tree-sitter-lang_name repository
-- 2. Clone it to your machine
-- 3. Build whole thing into a .so file using tree-sitter-cli tool
-- 4. Place the .so file into the \parser\ folder
-- 5. Grab 'highlights.scm' from the repository you cloned earlier
-- 6. Create a \lang_name\ folder in the \nvim\queries\ folder.
-- 7. Put the highlights.scm inside that folder so it looks exactly like \nvim\queries\lang_name\highlights.scm
-- 8. Go to the nvim lua config place where you start the treesitter(it is an autocmd with vim.treesitter.start() callback) and add new language to the pattern table
-- (e.g. pattern = { "lua", "json", "java" }). Note: that autocmd is located in this file(treesitter-setup.lua).
-- 9. It should work.
