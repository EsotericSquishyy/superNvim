return {
  {
    "goolord/alpha-nvim",
    enabled = false,
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
      local startify = require("alpha.themes.startify")
      startify.file_icons.provider = "mini"
      require("alpha").setup(require("alpha.themes.theta").config)
    end,
  }
}
