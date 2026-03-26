# Changelog

## [1.4.0] - 2026-03-26

### Added
- Git status indicators for unmerged and diverged states
- Version-manager-agnostic node version display (`node_prompt_info`)
- Version-manager-agnostic python version display (`python_prompt_info`)

### Changed
- Git status uses single `git status` call instead of two (performance)
- Git status uses native zsh pattern matching instead of grep subprocesses (performance)
- SSH check computed once at load time instead of every prompt (performance)

### Deprecated
- `nvm_prompt_info` (use `node_prompt_info`; old function still works)
- `pyenv_prompt_info` (use `python_prompt_info`; old function still works)

### Fixed
- Unquoted variable expansions in echo statements

### Removed
- Unused `get_space()` function

## [1.3.0] - 2021-07-12
- Autoload zsh colors module

## [1.2.0] - 2021-02-08
- Add pyenv version display
- Switch to unicode brackets and smaller git icons
- Add version badge

## [1.1.1] - 2017-10-04
- Switch nvm to node logo
- Remove makefile
- Readme improvements

## [1.0.4] - 2017-02-12
- Revert to white colors for Alacritty compatibility

## [1.0.3] - 2017-02-12
- Fix SSH spacing
- Change colors for Alacritty support

## [1.0.1] - 2017-02-09
- Initial stable release
