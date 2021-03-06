-- vim.cmd "colorscheme dracula"

local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- transparency
vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
