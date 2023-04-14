local icons = require('cmp_nerdfonts.icons')
local M = {}

local items = {}

function M.new()
  local self = setmetatable({}, { __index = M })
  return self
end

function M:get_keyword_pattern()
  return [[nf\-.*]]
end

function M:get_trigger_characters()
  return { 'nf-' }
end

function M:complete(params, callback)
  if #items == 0 then
    for _, entry in ipairs(icons) do
      local label = entry[1]
      local icon = entry[2]

      table.insert(items, {
        label = icon .. ' ' .. label,
        insertText = icon,
        filterText = label,
      })
    end
  end

  -- Returning the full list of icons on manual completion is too noisy to be useful
  if params.context.option.reason == 'manual' then
    callback({ items = {} })
  else
    callback({ items = items })
  end
end

return M
