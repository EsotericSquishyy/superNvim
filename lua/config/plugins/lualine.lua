-- Status bar and tabline
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local auto_theme_custom = require('lualine.themes.auto')
      auto_theme_custom.normal.c.bg = 'none' -- removes main background

      require('lualine').setup{
        options = {
          theme = auto_theme_custom,
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
