return {
  {
    -- Using snacks instead
    "goolord/alpha-nvim",
    enabled = true,
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
      local startify = require("alpha.themes.startify")
      startify.file_icons.provider = "mini"
      require("alpha").setup(require("alpha.themes.theta").config)
    end,
  }
}
