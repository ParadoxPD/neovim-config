function _G.Reload(name)
  package.loaded[name] = nil
  return require(name)
end

return {
  {
    dir = '/home/paradox/Documents/OSP/typr',
    name = 'typr',
    dependencies = 'nvzone/volt',
    config = function()
      require('typr').setup()
    end,
  },
  {
    dir = '/home/paradox/Documents/Projects/neovim-plugins/matrix-rain.nvim',
    name = 'matrixrain',
    config = function()
      require('matrixrain').setup()
    end,
  },
}
