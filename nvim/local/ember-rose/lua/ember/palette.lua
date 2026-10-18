-- ember/palette.lua
-- Direct translation of palette.json + emacs theme into Lua tables.
-- All ramp values are hand-tuned hex from the Emacs reference implementation.

local M = {}

-- Available variant names
M.variants = { "ember", "ember-soft", "ember-light" }

-- Complete variant definitions with hand-tuned background ramps.
-- Values taken directly from ember-theme.el / ember-soft-theme.el / ember-light-theme.el
local variants = {
  ["ember"] = {
    type   = "dark",
    bg     = "#1c1919",  -- H0   S5%  L10%
    bg_alt = "#242020",  -- H0   S4%  L13% — Emacs hl-line value
    base0  = "#151212",  -- H0   S8%  L7%
    base1  = "#1c1919",  -- H0   S5%  L10%
    base2  = "#252222",  -- H0   S5%  L14%
    base3  = "#2e2a2a",  -- H0   S5%  L17%
    base4  = "#3e3838",  -- H0   S5%  L23%
    base5  = "#585050",  -- H0   S5%  L33%
    base6  = "#706161",  -- H0   S8%  L41%
    base7  = "#907e7e",  -- H0   S8%  L53%
    base8  = "#b8a0a0",  -- H0   S12% L68%
    fg     = "#d8c0c0",  -- H0   S16% L82%
    fg_alt = "#b09898",  -- H0   S12% L64%
  },
  ["ember-soft"] = {
    type   = "dark",
    bg     = "#242020",  -- H0   S5%  L13%
    bg_alt = "#2a2727",  -- slightly lifted
    base0  = "#1c1919",  -- same as ember bg
    base1  = "#222020",  -- slightly lifted
    base2  = "#2c2828",  -- H0   S5%  L16%
    base3  = "#353030",  -- H0   S5%  L20%
    base4  = "#444040",  -- H0   S5%  L26%
    base5  = "#585050",  -- same as ember
    base6  = "#706161",  -- same as ember
    base7  = "#907e7e",  -- same as ember
    base8  = "#b8a0a0",  -- same as ember
    fg     = "#d8c0c0",  -- same as ember
    fg_alt = "#b09898",  -- same as ember
  },
  ["ember-light"] = {
    type   = "light",
    bg     = "#e6dac4",  -- H39  S40% L84%
    bg_alt = "#ddd0b8",  -- slightly darker parchment
    base0  = "#f0e8d8",  -- lightest
    base1  = "#e6dac4",  -- same as bg
    base2  = "#d8ccb0",  -- H39  S28% L78%
    base3  = "#cec2a8",  -- H39  S25% L74%
    base4  = "#b8ac96",  -- H39  S18% L65%
    base5  = "#989080",  -- H38  S12% L55%
    base6  = "#787060",  -- H40  S12% L43%
    base7  = "#605848",  -- H40  S14% L33%
    base8  = "#484030",  -- H40  S20% L24%
    fg     = "#282418",  -- H45  S25% L13%
    fg_alt = "#585040",  -- H40  S16% L30%
  },
}

-- Shared accent colors for dark variants
local accents_dark = {
  coral  = "#ff8888",  -- H0   S100% L77%  — hero
  orange = "#c05869",  -- H350 S42%  L55%
  gold   = "#c87168",  -- H5   S42%  L60%
  olive  = "#988468",  -- H36  S22%  L50%
  sage   = "#87a080",  -- H108 S14%  L56%
  steel  = "#78a094",  -- H163 S18%  L55%
  rose   = "#b0789f",  -- H318 S25%  L58%
  mauve  = "#8f8098",  -- H278 S12%  L55%
}

-- Accent colors tuned for the light variant (deeper / more saturated)
local accents_light = {
  coral  = "#b84c30",  -- H12  S59% L45%
  orange = "#946030",  -- H29  S51% L38%
  gold   = "#7a6820",  -- H48  S58% L30%
  olive  = "#4a6830",  -- H92  S37% L30%
  sage   = "#386858",  -- H160 S30% L31%
  steel  = "#3a6080",  -- H207 S38% L36%
  rose   = "#905050",  -- H0   S29% L44%
  mauve  = "#706070",  -- H300 S8%  L41%
}

--- Build and return the full palette table for a given variant.
---@param name string  one of M.variants
---@return table  flat palette with bg, fg, accents, and ramp
function M.get(name)
  local v = variants[name]
  assert(v, "ember: unknown variant '" .. tostring(name) .. "'")

  -- Start with all ramp values from the variant
  local pal = {
    type   = v.type,
    bg     = v.bg,
    bg_alt = v.bg_alt,
    base0  = v.base0,
    base1  = v.base1,
    base2  = v.base2,
    base3  = v.base3,
    base4  = v.base4,
    base5  = v.base5,
    base6  = v.base6,
    base7  = v.base7,
    base8  = v.base8,
    fg     = v.fg,
    fg_alt = v.fg_alt,
  }

  -- Pick the right accent set
  local accents = v.type == "light" and accents_light or accents_dark
  for k, hex in pairs(accents) do
    pal[k] = hex
  end

  return pal
end

return M
