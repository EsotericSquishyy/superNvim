return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          },
          extensions = {
            fzf = {}
          }
        }
      }
      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)     -- Find help tags
      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)    -- Find files
      vim.keymap.set("n", "<space>en", function()                                  -- Edit Nvim
        local opts = require('telescope.themes').get_dropdown({
          cwd = vim.fn.stdpath("config")
        })
        require('telescope.builtin').find_files(opts)
      end)

      require('config.telescope.multigrep').setup()
    end
  }
}
