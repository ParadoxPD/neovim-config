function _G.Reload(name)
  for k in pairs(package.loaded) do
    if k:match('^' .. name) then
      package.loaded[k] = nil
    end
  end
  require(name).setup()
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
