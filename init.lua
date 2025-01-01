require("config.lazy")

-- General Config
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = {
  -- eol = "↵",
  trail = "·",
  tab = ">-",
  nbsp = "␣"
}

-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Lua execution
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- Quickfix list
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Mini-Term
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
local job_id = 0
vim.keymap.set("n", "<leader>to", function()
  vim.cmd.vnew()
  vim.cmd.term()
  -- vim.cmd.term('bash -i') -- interactive shell required
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)

  job_id = vim.bo.channel
end)

local current_command = ""
vim.keymap.set("n", "<leader>te", function()
  current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<leader>tr", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)

-- Plugin Binds
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>tt", "<cmd>Floaterminal<CR>")
