-- Import the core package
require 'core.options'
require 'core.keymaps'

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'custom.plugins.theme',
  require 'custom.plugins.alpha',
  require 'custom.plugins.gitsigns',
  require 'custom.plugins.which-key',
  require 'custom.plugins.cloak',

  require 'custom.plugins.telescope',
  require 'custom.plugins.lazydev',
  require 'custom.plugins.nvim-lspconfig',
  --require 'custom.plugins.trouble',
  require 'custom.plugins.conform',
  --require 'custom.plugins.blink',
  require 'custom.plugins.nvim-cmp',
  require 'custom.plugins.none-ls',

  require 'custom.plugins.markdown-stuff',
  --require 'custom.plugins.temp',
  require 'custom.plugins.misc',
  require 'custom.plugins.mini',
  --require 'custom.plugins.typr',
  require 'custom.plugins.testing',

  require 'custom.plugins.treesitter',
  require 'custom.plugins.bufferline',
  require 'custom.plugins.neo-tree',

  require 'custom.plugins.undo-tree',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',

  require 'custom.plugins.rest',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
