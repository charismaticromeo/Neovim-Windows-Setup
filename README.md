
# Neovim Configuration (Windows-first, LSP-powered)

A modern **Neovim configuration for Windows**, focused on developer productivity with:

- Lazy.nvim plugin management
- Built-in LSP (Neovim ≥ 0.11)
- Autocompletion (nvim-cmp)
- Treesitter syntax highlighting
- Fuzzy finding (Telescope)
- File explorer (nvim-tree)
- Integrated terminal (toggleterm)
- Multi-language support (Python, Java, C, C++, Lua)
- Markdown rendering and code context helpers

This repository exists so I never have to rebuild my Neovim setup from scratch again.

---

## Repository Structure

```text
nvim/
├── init.lua
├── lazy-lock.json
├── README.md
├── lua/
│   ├── core/
│   │   ├── options.lua        -- Neovim options
│   │   ├── keymaps.lua        -- Global keybindings
│   │   └── autocmd.lua        -- Autocommands (format-on-save, etc.)
│   ├── plugins/
│   │   ├── init.lua           -- Lazy.nvim plugin loader
│   │   ├── lsp.lua            -- LSP + Mason setup
│   │   ├── autopairs.lua      -- Completion config
│   │   ├── cmp.lua            -- Completion config
│   │   ├── colorscheme.lua    -- Theme config
│   │   ├── jdtls.lua          -- JDTLS (Java) config
│   │   ├── telescope.lua      -- Fuzzy finder
│   │   ├── nvim-tree.lua      -- File explorer
│   │   ├── toggleterm.lua     -- Integrated terminal
│   │   ├── treesitter.lua     -- Syntax highlighting
│   │   └── render-markdown.lua
│   ├── lsp/
│   │   └── java.lua           -- Java (jdtls) configuration
│   └── tests/
│       ├── main.c
│       ├── main.exe
│       ├── Main.java
│       ├── Main.class
│       ├── test.cpp
│       ├── testcpp.exe
│       ├── test.py
│       └───tests
│ 
└── LICENSE
```

---
## Requirements / Prerequisites

### 1. Neovim

Neovim ≥ 0.11.0

Windows build recommended

Check:

```powershell

nvim --version
```

### 2. Git

Required for plugin installation.

```powershell

git --version
```

### 3. Language Runtimes & Tooling
3.1. Python

Python 3.10+

python and pip available in PATH

```powershell

python --version
pip --version
```

3.2. Java

JDK 17 or newer

JAVA_HOME set (recommended)

```powershell

java --version
echo $env:JAVA_HOME
```

3.3. C / C++

clangd (installed via Mason)

OR Visual Studio Build Tools

### 4. Recommended Tools

ripgrep (Telescope live grep)

fd (faster file search)

```powershell

rg --version
fd --version
```
---

## Installation & Setup

### 1. Clone the repository

```powershell

git clone https://github.com/charismaticromeo/Neovim-Windows-Setup.git $env:LOCALAPPDATA\nvim
```

This places the config where Neovim expects it on Windows.

___
### 2. Launch Neovim

```powershell

nvim
```

Lazy.nvim will:
- Install itself
- Install all plugins
- Compile the plugin cache

> [!NOTE] First launch may take a minute.

___
### 3. LSP Setup

Mason automatically installs:
- lua_ls
- pyright
- clangd

Java (jdtls) starts automatically when opening .java files inside a project directory.

___
### 4. Language Support

Language        Features

Lua             LSP, completion, formatting
Python          Pyright, completion, formatting
Java            jdtls, completion, diagnostics
C               clangd, completion
C++             clangd, completion
Markdown        Rendered preview, callouts, icons

___
### 5. Keybindigs

Leader key: <Space>

> [!TIP] File Explorer

Key	        Action
<leader>e	Toggle nvim-tree

> [!TIP] Telescope

Key	        Action
<leader>ff	Find files
<leader>fg	Live grep
<leader>fb	Buffers
<leader>fh	Help tags

> [!TIP] Terminal

Key	        Action
<leader>tt	Toggle terminal

> [!TIP] LSP

*Key	        Action*
gd	        Go to definition
K	        Hover documentation
<leader>rn	Rename
<leader>ca	Code action

___
### 6. Features

- Auto-format on save (when supported by LSP)
- Tab-based completion (not Enter)
- Auto-closing brackets and quotes
- Treesitter-powered syntax highlighting
- Git-aware file tree
- Ignored directories:
    - .git
    - node_modules
    - .env
    - .venv
    - dist

___
### 7. Troubleshooting

> [!WARNING] Java completion not working?
- Ensure file is inside a project folder
- Ensure JDK 17+
- Check active LSPs:

```vim

:LspInfo
```

> [!WARNING] Telescope Treesitter errors?
Install  missing parsers:

```vim

:TSInstall lua python java c cpp
```

> [!WARNING] Deprecated API warnings?

```vim

:checkhealth vim.deprecated
```

___
### 8. Credits

- Neovim core team
- Lazy.nvim
- nvim-lspconfig
- Mason.nvim
- Treesitter
- Telescope.nvim

___
### 9. LICENSE

This project is licensed under the MIT License.
See the LICENSE file for details.


