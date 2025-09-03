#!/usr/bin/env bash

# install mise
if ! command -v "mise" >/dev/null 2>&1; then
  curl https://mise.run | sh
  echo 'eval "$(~/.local/bin/mise activate bash)"' >>~/.bashrc
  eval "$(~/.local/bin/mise activate bash)"
fi

# FIX: install tmux (using mise), not working
# mise plugin add tmux
# mise install tmux@latest
# mise use -g tmux@latest

# install neovim
if ! command -v "nvim" >/dev/null 2>&1; then
  mise plugin add neovim
  mise install neovim@latest
  mise use -g neovim@latest
fi

# install lazyvim
if [[ ! -f ~/.config/nvim/lazyvim.json ]]; then
  mv ~/.config/nvim{,.bak}
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
fi

# install miniconda
if [[ ! -f ~/miniconda3/bin/activate ]]; then
  mkdir -p ~/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm ~/miniconda3/miniconda.sh

  source ~/miniconda3/bin/activate
  conda init --all

  conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
  conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

  # install tmux (using conda)
  conda install -y conda-forge::tmux
fi

# install atuin.sh
if ! command -v "atuin" >/dev/null 2>&1; then
  bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)
fi

# install github-cli (using mise)
if ! command -v "gh" >/dev/null 2>&1; then
  mise plugin add github-cli
  mise install github-cli@latest
  mise use -g github-cli@latest
fi

# set zsh as default
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# zsh antigen plugin manager
if [[ ! -f ~/antigen.zsh ]]; then
  curl -L git.io/antigen >~/antigen.zsh
fi

# setup dotfiles
./copy-dotfiles.sh
