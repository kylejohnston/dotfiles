-- ember/util.lua
-- Color math utilities for the Ember theme.
-- All functions operate on hex strings ("#rrggbb").

local M = {}

--- Convert a hex color string to RGB components (0-255).
---@param hex string  e.g. "#1c1b19"
---@return number r, number g, number b
local function hex_to_rgb(hex)
  hex = hex:gsub("^#", "")
  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)
  return r, g, b
end

--- Convert RGB components (0-255) to a hex color string.
---@param r number
---@param g number
---@param b number
---@return string  e.g. "#1c1b19"
local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x",
    math.floor(math.min(255, math.max(0, r)) + 0.5),
    math.floor(math.min(255, math.max(0, g)) + 0.5),
    math.floor(math.min(255, math.max(0, b)) + 0.5))
end

--- Linear blend between two hex colors.
--- amount=1.0 returns c1, amount=0.0 returns c2.
---@param c1 string  hex color
---@param c2 string  hex color
---@param amount number  0.0 to 1.0
---@return string  blended hex color
function M.blend(c1, c2, amount)
  local r1, g1, b1 = hex_to_rgb(c1)
  local r2, g2, b2 = hex_to_rgb(c2)
  local r = r1 * amount + r2 * (1 - amount)
  local g = g1 * amount + g2 * (1 - amount)
  local b = b1 * amount + b2 * (1 - amount)
  return rgb_to_hex(r, g, b)
end

--- Darken a hex color by blending toward black.
---@param color string  hex color
---@param amount number  0.0 = unchanged, 1.0 = black
---@return string
function M.darken(color, amount)
  return M.blend("#000000", color, amount)
end

--- Lighten a hex color by blending toward white.
---@param color string  hex color
---@param amount number  0.0 = unchanged, 1.0 = white
---@return string
function M.lighten(color, amount)
  return M.blend("#ffffff", color, amount)
end

-- Expose helpers for tests / advanced use
M.hex_to_rgb = hex_to_rgb
M.rgb_to_hex = rgb_to_hex

return M
