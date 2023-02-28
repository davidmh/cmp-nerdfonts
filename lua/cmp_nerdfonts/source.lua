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

function M:complete(_, callback)
  if #items == 0 then
    for _, entry in ipairs(icons) do
      local label = entry[1]
      local icon = entry[2]

      table.insert(items, {
        label = label .. ' ' .. icon,
        insertText = icon,
        filterText = label,
      })
    end
  end

  callback({ items = items })
end

return M
