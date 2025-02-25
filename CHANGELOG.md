# Changelog

## [1.3.1](https://github.com/Isrothy/neominimap.nvim/compare/v1.3.0...v1.3.1) (2024-07-12)


### Bug Fixes

* Correct buffer updating for diagnostic highlights ([38045d3](https://github.com/Isrothy/neominimap.nvim/commit/38045d37fdd2feffad6d1faaf50ab7f273959927))

## [1.3.0](https://github.com/Isrothy/neominimap.nvim/compare/v1.2.2...v1.3.0) (2024-07-12)


### Features

* **workflow:** Add panvimdoc workflow for generating vimdoc ([8204143](https://github.com/Isrothy/neominimap.nvim/commit/820414301e625219ef3ff1644fb1d65c30f69da0))

## [1.2.2](https://github.com/Isrothy/neominimap.nvim/compare/v1.2.1...v1.2.2) (2024-07-12)


### Bug Fixes

* call update_diagnostic on the correct buffers ([a3b53e6](https://github.com/Isrothy/neominimap.nvim/commit/a3b53e64573503197fc6106f06a6b59e2e7da0d4))

## [1.2.1](https://github.com/Isrothy/neominimap.nvim/compare/v1.2.0...v1.2.1) (2024-07-11)


### Bug Fixes

* Display only foreground color in minimap Treesitter highlights ([eaba632](https://github.com/Isrothy/neominimap.nvim/commit/eaba632b396c552f1b204e3abb258ebdc06d1378))

## [1.2.0](https://github.com/Isrothy/neominimap.nvim/compare/v1.1.1...v1.2.0) (2024-07-11)


### Features

* Add treesitter support ([ad0a740](https://github.com/Isrothy/neominimap.nvim/commit/ad0a740df20d1a40349097f2e2001be2a41113d4))

### Bug Fixed

* Correct indexing for Treesitter highlights in minimap ([0d1fdea](https://github.com/Isrothy/neominimap.nvim/commit/0d1fdea1ee8491a305ed4a8a212e982c23fcf14f))
* Fix Treesitter highlight index-out-of-bound in minimap ([5328153](https://github.com/Isrothy/neominimap.nvim/commit/5328153bfa5b9e1af9186d76f947c4da6227a458))
* Fix Another Treesitter highlight index-out-of-bound in minimap ([6fec961](https://github.com/Isrothy/neominimap.nvim/commit/6fec961dac3005c37886577c99369d430b363a8e))

## [1.1.1](https://github.com/Isrothy/neominimap.nvim/compare/v1.1.0...v1.1.1) (2024-07-11)


### Bug Fixes

* Fixed floor division in coordinate transformation ([404903b](https://github.com/Isrothy/neominimap.nvim/commit/404903b0be8fe1249a95aa55a0e270603e8a0063))
* Corrected wrong cursor column in minimap ([8a1dc0b](https://github.com/Isrothy/neominimap.nvim/commit/8a1dc0b00523a2e78334faaf37adefe00e5e4d56))

## [1.1.0](https://github.com/Isrothy/neominimap.nvim/compare/v1.0.0...v1.1.0) (2024-07-06)


### Features

* Add diagnostic support ([150bf76](https://github.com/Isrothy/neominimap.nvim/commit/150bf76b5e6c5f42adc287ef90ac289f09a1fdea))


### Bug Fixes

* correct window width ([cf3663d](https://github.com/Isrothy/neominimap.nvim/commit/cf3663df76756c0245e10eb4959fc21c06be2aaf))

## 1.0.0 (2024-07-04)

The first stable release of `neominimap.nvim`

### Features:

- **Code Minimap**: Displays a miniature version of your code on the right side of the windows.
- **Commands**:
  - `:NeominimapOpel`: Enable the minimap.
  - `:NeominimapClose`: Disable the minimap.
  - `:NeominimapToggle`: Toggle the minimap on or off.
 
### Known Issues
- Performance issues may occur with very large files.
