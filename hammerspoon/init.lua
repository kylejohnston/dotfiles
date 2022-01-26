-- Bug-fixed Spoon that handles modal key bindings
hs.loadSpoon('ModalMgr')
-- Modified Spoon that manages modal state and UI.
-- hs.loadSpoon('MiroWindowsManager')

local utils = require 'utils'
local K = require 'keys'
local ModalWrapper = require 'modal-wrapper'
-- local AppBinding = require 'app-binding'
local wm = require('window-management')

-- --------
-- Settings
-- --------
hs.autoLaunch(true)
hs.automaticallyCheckForUpdates(true)
hs.consoleOnTop(true)
hs.dockIcon(false)
hs.menuIcon(true)
hs.uploadCrashData(false)

-- Disable animation for window resizing so it's instant.
-- hs.window.animationDuration = 0

-- Global Bindings
-- hs.hotkey.bind({ K.ctrl }, '\\', 'Lock', hs.caffeinate.lockScreen)

-- Modal Bindings
local modalWrapper = ModalWrapper:new({ id = 'LAUNCHER', description = 'Launcher', color = '#eeff00', key = 'space', modifiers = { K.cmd }, exitAfter = 3 })
local HYPER = { K.ctrl, K.alt, K.cmd, K.shift }

local BINDINGS = {
-- Meta Hotkeys
  { description = 'Exit', key = 'escape', onEnter = function() end, },
  { description = 'Toggle cheatsheet', key = '/', modifiers = { K.shift }, keepModalActive = true, onEnter = function() modalWrapper:toggleCheatsheet() end, },
  { description = 'Reload hammerspoon', key = 'r', modifiers = { K.shift }, onEnter = function() hs.reload() end, },

-- APP HOTKEYS
  { description = 'Alfred',     key = 'space', noAdditionalCommandBinding = true, onEnter = utils.launchOrFocusApp('Alfred 4'), },
  { description = 'Chrome',     key = 'g', onEnter = utils.launchOrFocusApp('Google Chrome'), },
  { description = 'Code',       key = 'c', onEnter = utils.launchOrFocusApp('Visual Studio Code'), },
  { description = 'Figma',      key = 'f', onEnter = utils.launchOrFocusApp('Figma'), },
  { description = 'Finder',     key = 'f', modifiers = { K.shift }, onEnter = utils.launchOrFocusApp('Finder'), },
    { description = 'Finder - Hide Others', key = 'j', modifiers = { K.shift }, onEnter = function() local app = hs.application.find('Finder') if app then app:activate() app:selectMenuItem('Hide Others') else hs.application.launchOrFocus('Finder') end end, },
    { description = 'Finder - Downloads', key = 'd', modifiers = { K.shift }, onEnter = function() local app = hs.application.find('Finder') if app then app:activate() app:selectMenuItem('Downloads') else hs.application.launchOrFocus('Finder') end end, },
    { description = 'Finder - Sleep', key = 'q', modifiers = { K.shift }, onEnter = function() local app = hs.application.find('Finder') if app then app:activate() app:selectMenuItem('Sleep') else hs.application.launchOrFocus('Finder') end end, },
  { description = 'iA Writer',  key = 'w', onEnter = utils.launchOrFocusApp('iA Writer'), },
  { description = 'Messages',   key = 'm', onEnter = utils.launchOrHideApp('Messages.app'), },
  { description = 'Mimestream', key = 'e', onEnter = utils.launchOrHideApp('Mimestream'), },
  { description = 'Music',      key = 'l', onEnter = utils.launchOrFocusApp('Music'), },
  { description = 'Numi',       key = '=', onEnter = utils.launchOrFocusApp('Numi'), },
  { description = 'Obsidian',   key = 'n', onEnter = utils.launchOrFocusApp('Obsidian'), },
  { description = 'Optimage',   key = 'o', onEnter = utils.launchOrFocusApp('Optimage'), },
  { description = 'RememBear',  key = 'r', onEnter = utils.launchOrFocusApp('RememBear'), },
  { description = 'Safari',     key = 's', onEnter = utils.launchOrFocusApp('Safari'), },
  { description = 'Slack',      key = 'k', onEnter = utils.launchOrFocusApp('Slack'), },
  { description = 'iTerm',      key = 'p', onEnter = utils.launchOrFocusApp('iTerm'), },
  { description = 'Things',     key = 't', onEnter = utils.launchOrFocusApp('Things'), },
  { description = 'Transmit',   key = 'u', onEnter = utils.launchOrFocusApp('Transmit'), },
  { description = 'Zoom',       key = 'z', onEnter = utils.launchOrFocusApp('Zoom.us'), },

}

-- s.hotkey.bind(HYPER, "g", function()
-- hs.application.launchOrFocus('Music')
-- end)

  -- -----------------
  -- Window Management
  -- -----------------

-- Window Management

hs.hotkey.bind(HYPER, "f", function()     wm.windowMaximize(0) end)
hs.hotkey.bind(HYPER, "Right", function() wm.moveWindowToPosition(wm.screenPositions.right) end)
hs.hotkey.bind(HYPER, "Left", function()  wm.moveWindowToPosition(wm.screenPositions.left) end)
hs.hotkey.bind(HYPER, "q", function()     wm.moveWindowToPosition(wm.screenPositions.thirdLeft) end)
hs.hotkey.bind(HYPER, "w", function()     wm.moveWindowToPosition(wm.screenPositions.thirdRight) end)
hs.hotkey.bind(HYPER, "z", function()     wm.moveWindowToPosition(wm.screenPositions.twoThirdLeft) end)
hs.hotkey.bind(HYPER, "x", function()     wm.moveWindowToPosition(wm.screenPositions.twoThirdRight) end)
hs.hotkey.bind(HYPER, "Up", function()    wm.moveWindowToPosition(wm.screenPositions.top) end)
hs.hotkey.bind(HYPER, "Down", function()  wm.moveWindowToPosition(wm.screenPositions.bottom) end)
-- Center Window
hs.hotkey.bind(HYPER, "C", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local max = win:screen():frame()
	local x = f
	x.x = ((max.w - f.w) / 2) + max.x
	x.y = ((max.h - f.h) / 2) + max.y
	win:setFrame(x)
end)
hs.hotkey.bind(HYPER, "1", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
  local screen = win:screen()
	local max = screen:frame()
  f.w = 1440
  f.h = max.h
  win:setFrame(f)
  hs.alert.show('1440')
end)
hs.hotkey.bind(HYPER, "9", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
  local screen = win:screen()
	local max = screen:frame()
  f.w = 960
  f.h = 640
  win:setFrame(f)
  hs.alert.show('960×640')
end)

--  Move window to other display
hs.hotkey.bind(HYPER, 'd', function()
-- get the focused window
local win = hs.window.focusedWindow()
-- get the screen where the focused window is displayed, a.k.a. current screen
local screen = win:screen()
-- compute the unitRect of the focused window relative to the current screen
-- and move the window to the next screen setting the same unitRect
win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end)

-- ------------------
-- Clipboard shortcut
-- ------------------
-- hs.loadSpoon('ClipboardTool')
-- spoon.ClipboardTool:start()
-- spoon.ClipboardTool:bindHotkeys({
--   toggle_clipboard = { { "ctrl","alt","command","shift" }, "v" }
-- })

modalWrapper:bindKeys(BINDINGS)
modalWrapper:start()

-- So we can easily tell when Hammerspoon loads successfully
hs.alert.show('Hammerspoon loaded')
