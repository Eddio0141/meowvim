local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
  [[                                                                 $$\               ]],
  [[                                                                 \__|              ]],
  [[$$$$$$\$$$$\   $$$$$$\   $$$$$$\  $$\  $$\  $$\       $$\    $$\ $$\ $$$$$$\$$$$\  ]],
  [[$$  _$$  _$$\ $$  __$$\ $$  __$$\ $$ | $$ | $$ |      \$$\  $$  |$$ |$$  _$$  _$$\ ]],
  [[$$ / $$ / $$ |$$$$$$$$ |$$ /  $$ |$$ | $$ | $$ |       \$$\$$  / $$ |$$ / $$ / $$ |]],
  [[$$ | $$ | $$ |$$   ____|$$ |  $$ |$$ | $$ | $$ |        \$$$  /  $$ |$$ | $$ | $$ |]],
  [[$$ | $$ | $$ |\$$$$$$$\ \$$$$$$  |\$$$$$\$$$$  |         \$  /   $$ |$$ | $$ | $$ |]],
  [[\__| \__| \__| \_______| \______/  \_____\____/           \_/    \__|\__| \__| \__|]],
}
-- dashboard.section.buttons.val = {
--   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
--   dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
-- }
-- local handle = io.popen('fortune')
-- local fortune = handle:read("*a")
-- handle:close()
-- dashboard.section.footer.val = fortune

-- dashboard.config.opts.noautocmd = true

require("alpha").setup(dashboard.config)
