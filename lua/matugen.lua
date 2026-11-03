 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#101414',
    base01 = '#1d2021',
    base02 = '#272b2b',
    base03 = '#899393',
    base04 = '#bec8c9',
    base05 = '#e0e3e3',
    base06 = '#e0e3e3',
    base07 = '#e0e3e3',
    base08 = '#ffb4ab',
    base09 = '#d8bbf2',
    base0A = '#b1cbce',
    base0B = '#8dd2d8',
    base0C = '#d8bbf2',
    base0D = '#8dd2d8',
    base0E = '#b1cbce',
    base0F = '#cde8ea',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e0e3e3',          bg = '#101414' })
  hi('TelescopeBorder',         { fg = '#899393',             bg = '#101414' })
  hi('TelescopePromptNormal',   { fg = '#e0e3e3',          bg = '#101414' })
  hi('TelescopePromptBorder',   { fg = '#899393',             bg = '#101414' })
  hi('TelescopePromptPrefix',   { fg = '#8dd2d8',             bg = '#101414' })
  hi('TelescopePromptCounter',  { fg = '#bec8c9',  bg = '#101414' })
  hi('TelescopePromptTitle',    { fg = '#101414',             bg = '#8dd2d8' })
  hi('TelescopePreviewTitle',   { fg = '#101414',             bg = '#b1cbce' })
  hi('TelescopeResultsTitle',   { fg = '#101414',             bg = '#d8bbf2' })
  hi('TelescopeSelection',      { fg = '#e0e3e3',          bg = '#272b2b' })
  hi('TelescopeSelectionCaret', { fg = '#8dd2d8',             bg = '#272b2b' })
  hi('TelescopeMatching',       { fg = '#8dd2d8',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e0e3e3',          bg = '#101414' })
  hi('MiniPickBorder',         { fg = '#899393',             bg = '#101414' })
  hi('MiniPickPrompt',   { fg = '#e0e3e3',          bg = '#101414' })
  hi('MiniPickPromptPrefix',   { fg = '#8dd2d8',             bg = '#101414' })
  hi('MiniPickBorderText',    { fg = '#101414',             bg = '#8dd2d8' })
  hi('MiniPickMatchCurrent',      { fg = '#e0e3e3',          bg = '#272b2b' })
  hi('MiniPickPromptCaret', { fg = '#8dd2d8',             bg = '#272b2b' })
  hi('MiniPickMatchRanges',       { fg = '#8dd2d8',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
