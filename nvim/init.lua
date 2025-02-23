-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Disable backup files
vim.opt.backup = false
vim.opt.writebackup = false

-- Disable undo files
vim.opt.undofile = false
