return {
  'saghen/blink.cmp',
  enabled = true,
  --version = '*',
  build = 'cargo +nightly build --release',
  -- In case there are breaking changes and you want to go back to the last
  -- working release
  -- https://github.com/Saghen/blink.cmp/releases
  -- version = "v0.13.1",
  dependencies = {
    'moyiz/blink-emoji.nvim',
    --'Kaiser-Yang/blink-cmp-dictionary',
    'rafamadriz/friendly-snippets',
    'L3MON4D3/LuaSnip',
  },
  opts = { -- I noticed that telescope was extremeley slow and taking too long to open,
    -- assumed related to blink, so disabled blink and in fact it was related
    -- :lua print(vim.bo[0].filetype)
    -- So I'm disabling blink.cmp for Telescope
    --opts.enabled = function()
    --  -- Get the current buffer's filetype
    --  local filetype = vim.bo[0].filetype
    --  -- Disable for Telescope buffers
    --  if filetype == 'TelescopePrompt' or filetype == 'minifiles' or filetype == 'snacks_picker_input' then
    --    return false
    --  end
    --  return true
    --end

    -- NOTE: The new way to enable LuaSnip
    -- Merge custom sources with the existing ones from lazyvim
    -- NOTE: by default lazyvim already includes the lazydev source, so not adding it here again
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
      providers = {
        -- Example on how to configure dadbod found in the main repo
        -- https://github.com/kristijanhusak/vim-dadbod-completion
        -- dadbod = {
        --   name = 'Dadbod',
        --   module = 'vim_dadbod_completion.blink',
        --   min_keyword_length = 2,
        --   score_offset = 85, -- the higher the number, the higher the priority
        -- },
        --  https://github.com/moyiz/blink-emoji.nvim
        emoji = {
          module = 'blink-emoji',
          name = 'Emoji',
          score_offset = 93,        -- the higher the number, the higher the priority
          min_keyword_length = 2,
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
        -- -- https://github.com/Kaiser-Yang/blink-cmp-dictionary
        -- -- In macOS to get started with a dictionary:
        -- -- cp /usr/share/dict/words ~/github/dotfiles-latest/dictionaries/words.txt
        -- --
        -- -- NOTE: For the word definitions make sure "wn" is installed
        -- -- brew install wordnet
        -- dictionary = {
        --   module = 'blink-cmp-dictionary',
        --   name = 'Dict',
        --   score_offset = 20, -- the higher the number, the higher the priority
        --   -- https://github.com/Kaiser-Yang/blink-cmp-dictionary/issues/2
        --   enabled = true,
        --   max_items = 8,
        --   min_keyword_length = 3,
        --   opts = {
        --     -- -- The dictionary by default now uses fzf, make sure to have it
        --     -- -- installed
        --     -- -- https://github.com/Kaiser-Yang/blink-cmp-dictionary/issues/2
        --     --
        --     -- Do not specify a file, just the path, and in the path you need to
        --     -- have your .txt files
        --     dictionary_directories = { vim.fn.expand '~/github/dotfiles-latest/dictionaries' },
        --     -- Notice I'm also adding the words I add to the spell dictionary
        --     dictionary_files = {
        --       vim.fn.expand '~/github/dotfiles-latest/neovim/neobean/spell/en.utf-8.add',
        --       vim.fn.expand '~/github/dotfiles-latest/neovim/neobean/spell/es.utf-8.add',
        --     },
        --     -- --  NOTE: To disable the definitions uncomment this section below
        --     --
        --     -- separate_output = function(output)
        --     --   local items = {}
        --     --   for line in output:gmatch("[^\r\n]+") do
        --     --     table.insert(items, {
        --     --       label = line,
        --     --       insert_text = line,
        --     --       documentation = nil,
        --     --     })
        --     --   end
        --     --   return items
        --     -- end,
        --   },
        -- },
        --  -- -- Third class citizen mf always talking shit
        --  -- copilot = {
        --  --   name = "copilot",
        --  --   enabled = true,
        --  --   module = "blink-cmp-copilot",
        --  --   kind = "Copilot",
        --  --   min_keyword_length = 6,
        --  --   score_offset = -100, -- the higher the number, the higher the priority
        --  --   async = true,
        --  -- },
      },
    },

    cmdline = {
      enabled = true,
    },

    completion = {
      -- accept = {
      --   auto_brackets = {
      --     enabled = true,
      --     default_brackets = { ";", "" },
      --     override_brackets_for_filetypes = {
      --       markdown = { ";", "" },
      --     },
      --   },
      -- },
      --   keyword = {
      --     -- 'prefix' will fuzzy match on the text before the cursor
      --     -- 'full' will fuzzy match on the text before *and* after the cursor
      --     -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
      --     range = "full",
      --   },
      menu = {
        border = 'single',
      },
      documentation = {
        auto_show = true,
        window = {
          border = 'single',
        },
      },
    },

    fuzzy = {
      prebuilt_binaries = {
        force_version = '1.0.0',
      },
      --  --   -- Disabling this matches the behavior of fzf
      --  --   use_typo_resistance = false,
      --  --   -- Frecency tracks the most recently/frequently used items and boosts the score of the item
      --  use_frecency = true,
      --  --   -- Proximity bonus boosts the score of items matching nearby words
      --  use_proximity = true,
      implementation = 'lua',
    },

    snippets = {
      preset = 'luasnip', -- Choose LuaSnip as the snippet engine
    },

    -- -- To specify the options for snippets
    -- opts.sources.providers.snippets.opts = {
    --   use_show_condition = true, -- Enable filtering of snippets dynamically
    --   show_autosnippets = true, -- Display autosnippets in the completion menu
    -- }

    -- The default preset used by lazyvim accepts completions with enter
    -- I don't like using enter because if on markdown and typing
    -- something, but you want to go to the line below, if you press enter,
    -- the completion will be accepted
    -- https://cmp.saghen.dev/configuration/keymap.html#default
    keymap = {
      preset = 'default',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },

      ['<Up>'] = { 'snippet_forward', 'fallback' },
      ['<Down>'] = { 'snippet_backward', 'fallback' },

      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<S-k>'] = { 'scroll_documentation_up', 'fallback' },
      ['<S-j>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
    },
  },
  opts_extend = { 'sources.default' },
}
