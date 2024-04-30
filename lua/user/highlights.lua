-- for some reason a plugin overrides the Pmenu colors to something else 
-- this is a fix for that issue
vim.api.nvim_set_hl(0, "Pmenu", { fg='#9399b3', bg='#1a1b26'})
