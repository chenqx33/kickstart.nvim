-- nvim/lua/plugins/nvim-java.lua
return {
  'nvim-java/nvim-java',
  lazy = false,
  config = function()
    require('java').setup {
      jdtls = {
        version = 'v1.46.1',
      },
    }
  end,
}
