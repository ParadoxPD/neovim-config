return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- set to "tabs" to only show tabpages instead
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        path_components = 1, -- Show only the file name without the directory
        modified_icon = '●',
        max_name_length = 30,
        tab_size = 21,
        diagnostics = 'nvim_lsp',
        color_icons = true,
        show_buffer_icons = true,
        always_show_bufferline = true,
        maximum_length = 15,
        sort_by = 'insert_at_end',
        hover = {
          enabled = true,
          delay = 0,
          reveal = { 'close' },
        },
        separator_style = 'slope',
      },
    }
  end,
}
