return {
  'navarasu/onedark.nvim',
  name = 'onedark',
  priority = 1000, -- Make sure to load this before all the other start plugins.

  config = function()
    -- Lua
    require('onedark').setup {
      style = 'dark',     -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      term_colors = true, -- Change terminal color as per the selected theme style
      -- vim.cmd [[colorscheme tokyonight]],

      code_style = {
        comments = 'italic',
      },

      diagnostics = {
        darker = true,     -- darker colors for diagnostic
        undercurl = true,  -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    }

    vim.cmd.colorscheme 'onedark'
    vim.cmd.hi 'Comment gui=none'
  end,
}
