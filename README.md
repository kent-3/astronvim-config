# AstroNvim User Configuration

A user configuration for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## Prerequisites

#### Windows

- `clang`
- `cmake`
- `ripgrep`
- `fd`

Use Visual Studio Installer to install 'Desktop development with C++'.
Under 'Optional', select MSVC, C++ CMake tools, and C++ Clang tools.

From scoop package manager:

```shell
scoop install ripgrep fd
```

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

###### On Windows

Add this to `lua/plugins/telescope.lua`

```lua
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = vim.fn.executable "cmake" == 1,
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
```

Delete this line from `lua/plugins/dap.lua` (silences warnings coming from Astro community plugins)

```lua
  enabled = vim.fn.has "win32" == 0,
```

#### Clone the repository

```shell
git clone https://github.com/kent-3/astronvim-config.git ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```
