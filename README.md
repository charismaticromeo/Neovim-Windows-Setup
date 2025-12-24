
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
