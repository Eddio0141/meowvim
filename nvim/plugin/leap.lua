local keymap = vim.keymap

keymap.set({ 'n', 'x' }, 's', '<Plug>(leap)')
keymap.set({ 'o' }, 'x', '<Plug>(leap)')
keymap.set('n', 'S', '<Plug>(leap-from-window)')

local leap = require("leap")
local leap_user = require("leap.user")

leap.opts.preview = function(ch0, ch1, ch2)
  return not (
    ch1:match('%s')
    or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
  )
end

leap.opts.equivalence_classes = {
  ' \t\r\n', '([{', ')]}', '\'"`'
}

leap_user.set_repeat_keys('<enter>', '<backspace>')
