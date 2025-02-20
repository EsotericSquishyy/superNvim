-- Status bar and tabline
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local base16 = require('lualine.themes.base16')
      base16.normal.c.bg = 'none' -- removes main background

      require('lualine').setup{
        options = {
          theme = base16,
          globalstatus = true,
          always_show_tabline = true,
        },
        tabline = {
          lualine_a = {
            {
              'tabs',
              mode = 1,
            }
          },
        },
      }
    end
  }
}
