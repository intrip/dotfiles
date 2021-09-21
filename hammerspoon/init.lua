require "clipboard"

local grid = require "grid"

local mash = {"cmd", "alt" }
local mashalt = {"cmd", "alt", "ctrl"}

-- window hints
hs.hints.showTitleThresh = 0
hs.hotkey.bind(mashalt, 'i', hs.hints.windowHints)

-- Change screen
-- TODO Currently not working, need to fix it
--hs.hotkey.bind(mash, 'p', grid.pushwindow_nextscreen)

-- Snap Window
hs.hotkey.bind(mash, 'h', grid.snap_west)
hs.hotkey.bind(mash, 'l', grid.snap_east)
hs.hotkey.bind(mash, 'k', grid.snap_north)
hs.hotkey.bind(mash, 'j', grid.snap_south)

hs.hotkey.bind(mashalt, 'h', grid.snap_northwest)
hs.hotkey.bind(mashalt, 'k', grid.snap_northeast)
hs.hotkey.bind(mashalt, 'j', grid.snap_southwest)
hs.hotkey.bind(mashalt, 'l', grid.snap_southeast)
