-- require('better-comment').Setup()
-- local cmp = require("nvim-cmp")
local opt = vim.opt
local g = vim.g
require("custom.plugins")
-- require("custom.configs")
-- local cmp = require "cmp"
--
-- custom/init.lua (this file) seems to be mostly for globals
-- You put vim globals in Lua using vim.g.[global param]
-- So I can use the below line for my "snippets" path
-- vim.g.vscode_snippets_path = "my snippets path"
-- Snippets seem cool (reusable code chunks for common things) but Idk if I'll use them.

function openMarkdownPreview(url)
  local browser_command = "firefox --new-window " .. url
  local job_id = vim.fn.jobstart(browser_command, {
    on_exit = function(_, code, _)
      if code ~= 0 then
        print("Error opening Firefox.")
      end
    end,
  })
  vim.fn.jobwait({job_id}, -1)
end

vim.g.mkdp_browserfunc = 'openMarkdownPreview'

