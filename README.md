
# 🛠️ joey-home-setting

A terminal development environment for those working primarily in Neovim, while remaining fully compatible with Vim.

This setup was refined from the daily workflow of working on **large-scale codebases** and **living in the terminal full-time**, where split navigation, search speed, and editing fluidity matter.

Highlights:

- ⚡ Fast-start Neovim config with Treesitter and Lua plugins  
- 🔁 Vim-compatible setup—gracefully degrades in pure Vim  
- 🔧 Carefully crafted `.bashrc`, `.tmux.conf`, `.inputrc` for productivity  
- 🎨 Aesthetically pleasing UI: floating terminals, colorized UI, readable statusline  
- 🪟 Tmux navigation built on **Vim-style philosophy**—intuitive split and movement keys

## 📦 Recommended: Build and Run in Docker

### 1. Build the dev container image

```bash
git clone https://github.com/joy369/joey-home-setting.git
cd joey-home-setting/docker
docker build \
  --build-arg USER="$(whoami)" \
  --build-arg UID="$(id -u)" \
  --build-arg GID="$(id -g)" \
  -t joey-image \
  -f Dockerfile_2404_GPU .
````

### 2. Run the container with GPU support

```bash
docker run --gpus all \
  -dit \
  --pid host \
  --name joey-container \
  joey-image:latest

docker attach joey-container
```

---

## 💻 Pure Local Installation (Without Docker)

### 1. 🧾 Prerequisites

* **OS**: Ubuntu 22.04+ (or Ubuntu 20.04 with Neovim 0.10.0)
* **Neovim**: v0.11.0 or higher
  or
* **Vim**: v8.2 or higher (partial feature support only)

> 🔗 If you want to enable GPU acceleration for ML workloads, ensure your system is set up correctly:
> See [NVIDIA GPU Setup Guide (official)](https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html)

---

### 2. 🧩 Git Clone and Install Required Packages

```bash
git clone https://github.com/joy369/joey-home-setting.git
sudo apt update
sudo apt install -y \
  curl git htop fzf gnupg ripgrep tmux universal-ctags \
  python3-pip python3.10 python3-venv

pip install --break-system-packages python-lsp-server
```

---

### 3. 🗂 Shared Shell Environment Setup

Regardless of Vim or Neovim, these CLI configs are the same :

```bash
mv joey-home-setting/.bashrc ~/
mv joey-home-setting/.inputrc ~/
mv joey-home-setting/.tmux.conf ~/
```

---
### 4. 📓 Neovim/vim setup
#### 🧙‍♂️ Option 1: Full Setup (Neovim Users)

```bash
# Ensure Neovim >= 0.11.0 is installed
nvim --version

# Apply config
mkdir -p ~/.config
mv joey-home-setting/.config/nvim ~/.config/
```

Launch Neovim and install plugins:

```vim
:source ~/.config/nvim/plugins_install.vim
:PlugInstall
```

---

#### 🧘 Option 2: Vim-Only Setup (Vim 8.2+)

This setup avoids Lua plugins and uses only Vim-compatible scripts.

```bash
# Move to .vim structure
mkdir -p ~/.vim
cp joey-home-setting/.config/nvim/init.vim ~/.vimrc
cp joey-home-setting/.config/nvim/plugins_install.vim ~/.vim/
cp joey-home-setting/.config/nvim/plugins_setting.vim ~/.vim/
```

Then in Vim:

```vim
:source ~/.vim/plugins_install.vim
:PlugInstall
```

---

## 🔎 Notes

* Neovim users get full support for Treesitter, LSP, Lua plugins, and async UI features.
* Vim users get syntax highlighting, fuzzy search tag navigation, and similar interface experience.
* This repo retains `vimscript` for maximum portability and fallback.
* Uses `vim-plug` for lightweight plugin management.

---

## 🌟 Credits

This setup is tuned from years of real-world development usage, with speed and clarity in mind.
Ideal for ML/AI engineers, terminal power users, and Vim/Neovim daily drivers.


## 🔗 License
[MIT](./LICENSE) © joy369
