-- Bug-fixed Spoon that handles modal key bindings
hs.loadSpoon('ModalMgr')
-- Modified Spoon that manages modal state and UI.
-- hs.loadSpoon('MiroWindowsManager')

local utils = require 'utils'
local K = require 'keys'
local ModalWrapper = require 'modal-wrapper'
local AppBinding = require 'app-binding'

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
hs.window.animationDuration = 0

-- ---------------
-- Global Bindings
-- ---------------
-- hs.hotkey.bind({ K.ctrl }, '\\', 'Lock', hs.caffeinate.lockScreen)

-- --------------
-- Modal Bindings
-- --------------

local modalWrapper = ModalWrapper:new({
  id = 'LAUNCHER',
  description = 'Launcher',
  color = '#ff3300',
  key = 'space',
  modifiers = { K.cmd },
  exitAfter = 3,
})
local HYPER = { K.ctrl, K.alt, K.cmd, K.shift }

local BINDINGS = {
  -- ------------
  -- Meta Hotkeys
  -- ------------
  -- {
  --   description = 'Exit',
  --   key = 'space',
  --   modifiers = { K.cmd },
  --   noAdditionalCommandBinding = true,
  --   onEnter = function() end,
  -- },
  {
    description = 'Exit',
    key = 'escape',
    onEnter = function() end,
  },
  {
    description = 'Toggle cheatsheet',
    key = '/',
    modifiers = { K.shift },
    keepModalActive = true,
    onEnter = function() modalWrapper:toggleCheatsheet() end,
  },
  {
    description = 'Reload hammerspoon',
    key = 'r',
    modifiers = { K.shift },
    onEnter = function() hs.reload() end,
  },

  -- -----------
  -- App Hotkeys
  -- -----------
  {
    description = 'Alfred',
    key = 'space',
    noAdditionalCommandBinding = true,
    onEnter = utils.launchOrFocusApp('Alfred 3'),
  },
  {
    description = 'Bear',
    key = 'b',
    onEnter = utils.launchOrFocusApp('Bear'),
  },
  {
    description = 'Numi',
    key = '=',
    onEnter = utils.launchOrFocusApp('Numi'),
  },
  {
    description = 'Code',
    key = 'c',
    onEnter = utils.launchOrFocusApp('Visual Studio Code'),
  },
  {
    description = 'Figma',
    key = 'g',
    onEnter = utils.launchOrFocusApp('Figma'),
  },
  {
    description = 'Firefox',
    key = 'f',
    onEnter = utils.launchOrFocusApp('Firefox'),
  },
  {
    description = 'Finder',
    key = 'f',
    modifiers = { K.shift },
    onEnter = utils.launchOrFocusApp('Finder'),
  },
  {
    description = 'Finder - Downloads',
    key = 'd',
    modifiers = { K.shift },
    onEnter = function()
      local app = hs.application.find('Finder')
      if app then
        app:activate()
        app:selectMenuItem('Downloads')
      else
        hs.application.launchOrFocus('Finder')
      end
    end,
  },
  {
    description = 'Finder - Hide Others',
    key = 'j',
    modifiers = { K.shift },
    onEnter = function()
      local app = hs.application.find('Finder')
      if app then
        app:activate()
        app:selectMenuItem('Hide Others')
      else
        hs.application.launchOrFocus('Finder')
      end
    end,
  },
  {
    description = 'Finder - Sleep',
    key = 'q',
    modifiers = { K.shift },
    onEnter = function()
      local app = hs.application.find('Finder')
      if app then
        app:activate()
        app:selectMenuItem('Sleep')
      else
        hs.application.launchOrFocus('Finder')
      end
    end,
  },
  {
    description = 'Music',
    key = 'i',
    onEnter = utils.launchOrHideApp('Music'),
  },
  {
    description = 'Messages',
    key = 'm',
    onEnter = utils.launchOrHideApp('Messages'),
  },
  {
    description = 'Optimage',
    key = 'o',
    onEnter = utils.launchOrFocusApp('Optimage'),
  },
  {
    description = 'RememBear',
    key = 'r',
    onEnter = utils.launchOrFocusApp('RememBear'),
  },
  {
    description = 'Slack',
    key = 's',
    onEnter = utils.launchOrFocusApp('Slack'),
  },
  {
    description = 'Terminal',
    key = 'p',
    onEnter = utils.launchOrFocusApp('Terminal'),
  },
  {
    description = 'Things',
    key = 't',
    onEnter = utils.launchOrFocusApp('Things'),
  },
  {
    description = 'Transmit',
    key = 'u',
    onEnter = utils.launchOrFocusApp('Transmit'),
  },
  {
    description = 'iA Writer',
    key = 'w',
    onEnter = utils.launchOrFocusApp('iA Writer'),
  },

  -- --------------
  -- Screen Capture
  -- --------------
  {
    description = 'Screenshot',
    key = '3',
    onEnter = utils.screenCapture(),
  },
  {
    description = 'Screenshot Selection',
    key = '4',
    onEnter = utils.screenCapture(true),
  },
}

  -- -----------------
  -- Window Management
  -- -----------------
  -- Fullscreen Window
  hs.hotkey.bind(HYPER, "F", function()
    local win = hs.window.focusedWindow()
    if not win then return end
    win:moveToUnit(hs.layout.maximized)
  end)

  -- Half-size Window, Left
  hs.hotkey.bind(HYPER, "Left", function()
    local win = hs.window.focusedWindow()
    if not win then return end

    win:moveToUnit(hs.layout.left50)
  end)

  -- Half-size Window, Right
  hs.hotkey.bind(HYPER, "Right", function()
    local win = hs.window.focusedWindow()
    if not win then return end
    win:moveToUnit(hs.layout.right50)
  end)

  -- Half-size Window, Upper
  hs.hotkey.bind(HYPER, "Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
  end)

  -- Half-size Window, Lower
  hs.hotkey.bind(HYPER, "Down", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
  end)

  -- 3/4 Window, Left
  hs.hotkey.bind(HYPER, "Z", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    f.y = max.y
    f.w = max.w * .75
    f.h = max.h
    win:setFrame(f)
  end)

  -- 1/4-size Window, Right
  hs.hotkey.bind(HYPER, "X", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + (max.w * .75  )
    f.y = max.y
    f.w = max.w * .25
    f.h = max.h
    win:setFrame(f)
  end)

  -- 3/4 Window, Left
  hs.hotkey.bind(HYPER, "V", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + (max.w * .25)
    f.y = max.y
    f.w = max.w * .75
    f.h = max.h
    win:setFrame(f)
  end)

  -- 1/4-size Window, Right
  hs.hotkey.bind(HYPER, "B", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    f.y = max.y
    f.w = max.w * .25
    f.h = max.h
    win:setFrame(f)
  end)

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

  -- Move window to other display
  hs.hotkey.bind(HYPER, 'm', function()
    -- get the focused window
    local win = hs.window.focusedWindow()
    -- get the screen where the focused window is displayed, a.k.a. current screen
    local screen = win:screen()
    -- compute the unitRect of the focused window relative to the current screen
    -- and move the window to the next screen setting the same unitRect
    win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
  end)


modalWrapper:bindKeys(BINDINGS)
modalWrapper:start()



-- So we can easily tell when Hammerspoon loads successfully
hs.alert.show('Hammerspoon loaded')
