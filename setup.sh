#!/usr/bin/bash

# install mise
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate bash)"' >>~/.bashrc
eval "$(~/.local/bin/mise activate bash)"

# FIX: install tmux (using mise), not working
# mise plugin add tmux
# mise install tmux@latest
# mise use -g tmux@latest

# install neovim
mise plugin add neovim
mise install neovim@latest
mise use -g neovim@latest

# install lazyvim
mv ~/.config/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# install miniconda
if ! command -v "conda" >/dev/null 2>&1; then
  mkdir -p ~/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
  rm ~/miniconda3/miniconda.sh

  source ~/miniconda3/bin/activate
  conda init --all

  conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
  conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
fi

# install tmux (using conda)
conda install -y conda-forge::tmux

# install atuin.sh
bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)

# install github-cli (using mise)
mise plugin add github-cli
mise install github-cli@latest
mise use -g github-cli@latest

# set zsh as default
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# zsh antigen plugin manager
if [[ ! -f ~/antigen.zsh ]]; then
  curl -L git.io/antigen >~/antigen.zsh
fi

# install spaceship prompt
# tmp="$(mktemp)"
# curl -fsSL https://starship.rs/install.sh -o "$tmp" && sh "$tmp" --yes
# rm -f "$tmp"

# setup dotfiles
./copy-dotfiles.sh
