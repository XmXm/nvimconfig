# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a LazyVim-based Neovim configuration. LazyVim is a modern Neovim distribution that provides a complete IDE-like experience with minimal configuration needed.

## Common Development Tasks

### Managing Plugins
- Add new plugins: Create a new file in `lua/plugins/` or add to existing plugin spec files
- Update plugins: Run `:Lazy sync` in Neovim
- Lock plugin versions: The `lazy-lock.json` file tracks exact plugin versions

### Code Formatting
- Lua files are formatted with Stylua (configuration in `stylua.toml`)
- Uses tabs (width 4) instead of spaces

### Testing Changes
- Open Neovim to test configuration changes
- Check for errors with `:checkhealth`
- View LazyVim keymaps with `<leader>sk` (search keymaps)

## Architecture

### Configuration Structure
The configuration is organized following LazyVim conventions:
- `init.lua` - Entry point that loads the lazy.nvim plugin manager
- `lua/config/` - Core configuration files:
  - `lazy.lua` - Plugin manager setup and LazyVim bootstrap
  - `options.lua` - Vim options (tab settings, no backups, WSL clipboard support)
  - `keymaps.lua` - Custom keymappings (Ctrl+Z/Y for undo/redo, Ctrl+C for copy)
  - `autocmds.lua` - Custom autocommands (currently empty)
- `lua/plugins/` - Custom plugin specifications

### Key Customizations
1. **WSL Support**: Automatically configures `win32yank` for clipboard integration when running in WSL
2. **Tab Settings**: Uses hard tabs (width 4) instead of spaces
3. **No Backup Files**: Disables backup, writebackup, and swapfile for cleaner operation
4. **Windows-style Shortcuts**: Ctrl+Z for undo, Ctrl+Y for redo, Ctrl+C for copy

### Plugin Management
Uses lazy.nvim with LazyVim's plugin ecosystem. Custom plugins should be added to `lua/plugins/` following the lazy.nvim specification format shown in `example.lua`.