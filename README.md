# Neominimap

## Overview

This plugin provides a visual representation of your code structure on the side
of your windows, similar to the minimap found in many modern editors.

Criticisms are welcome.

## Screenshots

<img width="2559" alt="image" src="https://github.com/user-attachments/assets/029d61c7-94ac-4e68-9308-3c82a3c07fef">

## Features

- LSP Integration
- TreeSitter Integration

## Installation

With Lazy:

```lua
{
  "Isrothy/neominimap.nvim",
  enabled = true,
  lazy = false, -- WARN: NO NEED to Lazy load
  init = function()
    vim.opt.wrap = false -- Recommended
    vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
    vim.g.neominimap = {
      auto_enable = true,
    }
  end,
},

```

## Configuration

The following is the default configuration.

```lua
vim.g.neominimap = {
    -- Enable the plugin by default
    auto_enable = true,

    -- Log level
    log_level = vim.log.levels.OFF,

    -- Notification level
    notification_level = vim.log.levels.INFO,

    -- Path to the log file
    log_path = vim.fn.stdpath("data") .. "/neominimap.log",

    -- Minimap will not be created for buffers of these types
    exclude_filetypes = { "help" },

    -- Minimap will not be created for buffers of these types
    exclude_buftypes = {
        "nofile",
        "nowrite",
        "quickfix",
        "terminal",
        "prompt",
    },
    
    -- When false is returned, the minimap will not be created for this buffer
    buf_filter = function(bufnr)
        return true
    end

    -- When false is returned, the minimap will not be created for this window
    win_filter = function(winid)
        return true
    end

    -- Maximum height for the minimap
    -- If set to nil, there is no maximum height restriction
    max_minimap_height = nil,

    -- Width of the minimap window
    minimap_width = 20,

    -- How many columns a dot should span
    x_multiplier = 4,

    -- How many rows a dot should span
    y_multiplier = 1,

    -- For performance issue, when text changed,
    -- minimap is refreshed after a certain delay
    -- Set the delay in milliseconds
    delay = 200,

    -- Z-index for the floating window
    z_index = 1,

    -- Diagnostic integration
    diagnostic = {
        enabled = true,
        severity = vim.diagnostic.severity.WARN,
        priority = {
            ERROR = 100,
            WARN = 90,
            INFO = 80,
            HINT = 70,
        },
    },

    treesitter = {
        enabled = true,
        priority = 200,
    },

    -- Border style of the floating window
    -- Accepts all usual border style options (e.g., "single", "double")
    window_border = "single",
}
```

## Commands

- MinimapToggle - Toggle the minimap on and off.
- MinimapOpen - Open the minimap.
- MinimapClose - Close the minimap.

## How it works

For every file opened, the plugin generates a corresponding minimap buffer.

When a buffer is displayed in a window,
the minimap buffer is automatically opened side by side with the main window.

This approach minimizes unnecessary rendering when
- Multiple windows are open for same file
- Switching between buffers within a window

### TreeSitter integration

First, the plugin retrieves all Treesitter nodes in the buffer.

For each codepoint in the minimap,
the plugin calculates which highlight occurs most frequently
and displays it.
If multiple highlights occur the same number of times,
all of them are displayed.

Note that the plugin considers which highlights are *applied*,
rather than which highlights are *shown*.
Specifically, when many highlights are applied to a codepoint,
it is possible that only some of them are visible.
However, all applied highlights are considered in the calculation.
As a result, unshown highlights may be displayed in the minimap,
leading to potential inconsistencies
between the highlights in the minimap and those in the buffer.

## Tips

### Disable minimap for large file

```lua
buf_filter = function(bufnr)
  local line_count = vim.api.nvim_buf_line_count(bufnr)
  return line_count < 4096
end,
```

## TODO

- [x] LSP integration
- [x] TreeSitter integration
- [ ] Git integration
- [ ] Search integration
- [ ] Support for window relative to editor
- [ ] Validate user configuration
- [x] Documentation
- [ ] Performance improvements
- [ ] More test cases

## Non-Goals

- Scrollbar.
  Use [satellite.nvim](https://github.com/lewis6991/satellite.nvim),
      [nvim-scrollview](https://github.com/dstein64/nvim-scrollview)
  or other plugins.
- Display screen bounds like
  [codewindow.nvim](https://github.com/gorbit99/codewindow.nvim).
  For performance, this plugin creates a minimap buffer for each buffer.
  Since a screen bound is a windowwise thing,
  it's not impossible to display them by highlights.

## Similar projects and comparasions

- [codewindow.nvim](https://github.com/gorbit99/codewindow.nvim)
  - Codewindow.nvim renders the minimap whenever focus is switched to a
    different window or the buffer is switched. In contrast, this plugin caches
    the minimap, so it only renders the minimap when the text is changed. Thus,
    this plugin should have better performance when you frequently switch
    windows or buffers.
  - Codewindow.nvim renders the minimap based on bytes, while this plugin
    renders based on codepoints. Specifically, it respects UTF-8 encoding and
    tab width.
  - Codewindow.nvim currently has more features like git integration and focus
    on the minimap, which this plugin does not.

- [mini.map](https://github.com/echasnovski/mini.map)
  - Mini.map allows for encode symbol customization, while this plugin does not.
  - Mini.map includes a scrollbar, which this plugin does not.
  - Mini.map does not have Treesitter integration, which this plugin does.
  - Mini.map rescales the minimap so that the height is equal to the window
    height, while this plugin generates the minimap by a fixed compression
    rate.
  - Mini.map does not cache the minimap neither, but it is still performant.

- [minimap.vim](https://github.com/wfxr/minimap.vim)
  - Just like Mini.map, Minimap.vim scales minimap.
  - Minimap.vim uses a Rust program to generate minimaps efficiently, while
    this plugin is written in Lua.
  - Minimap.vim does not have Treesitter or LSP integration, which this plugin
    does.

## Acknowledgements

Thanks to [gorbit99](https://github.com/gorbit99) for
[codewindow.nvim](https://github.com/gorbit99/codewindow.nvim),
by which this plugin was inspired.
The map generation algorithm and TreeSitter integration algorithm are also
learned from that project.


