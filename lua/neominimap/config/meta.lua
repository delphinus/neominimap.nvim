local M = {}

---@class Neominimap.UserConfig
---@field auto_enable boolean?
---@field log_path string?
---@field log_level (string | integer)?
---@field notification_level (string | integer)?
---@field exclude_filetypes (string[])?
---@field exclude_buftypes (string[])?
---@field buf_filter (fun(bufnr: integer): boolean)?
---@field win_filter (fun(winid: integer): boolean)?
---@field minimap_width integer?
---@field x_multiplier integer?
---@field y_multiplier integer?
---@field delay integer?
---@field diagnostic Neominimap.DiagnosticConfig?
---@field treesitter Neominimap.TreesitterConfig?
---@field use_git boolean?
---@field z_index integer?
---@field window_border (string | string[])?

---@class Neominimap.DiagnosticConfig
---@field enabled boolean?
---@field severity integer?
---@field priority Neominimap.InternalDiagnosticPriority?

---@class Neominimap.DiagnosticPriority
---@field ERROR integer?
---@field WARN integer?
---@field INFO integer?
---@field HINT integer?

---@class Neominimap.TreesitterConfig
---@field enabled boolean?
---@field priority integer?

---@type Neominimap.UserConfig | fun():Neominimap.UserConfig | nil
vim.g.neominimap = vim.g.neominimap

return M
