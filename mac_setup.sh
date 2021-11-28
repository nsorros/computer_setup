#!/usr/bin/env bash

xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

PACKAGES=(
  git
  tmux
  pyenv
  fish
  wget
  htop
  ncdu
  direnv
  bat
  dvc
  jq
  gh
  awscli
  1password-cli
)

brew install ${PACKAGES[@]}

brew cleanup

CASKS=(
  slack
  microsoft-teams
  zoom
  docker
  iterm2
  keybase
  whatsapp
  spotify
  signal
  1password
)

brew install --cask ${CASKS[@]}

# This fails due to ssh keys for some reason
brew tap wellcometrust/homebrew-wellcome-tap git@github.com:wellcometrust/homebrew-wellcome-tap.git
brew install remote

# One password signin
eval $(op signin https://my.1password.com nsorros@gmail.com)

# Get and config ssh keys
mkdir ~/.ssh
op get document ssh_private_key > ~/.ssh/id_rsa
op get document ssh_public_key > ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
cat << EOF > ~/.ssh/config
  Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa
EOF
eval $(ssh-agent -c)
ssh-add -K ~/.ssh/id_rsa

# Git config
git config --global user.name "Nick Sorros"
git config --global user.email "nsorros@gmail.com"

# AWS CLI
# curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
# sudo installer -pkg AWSCLIV2.pkg -target /

# Python config
pyenv install 3.8.7
pyenv install 3.7.9
pyenv install 3.9.1
pyenv global 3.7.9

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish
echo "status is-login; and pyenv init --path | source" >> ~/.config/fish.config.fish
echo "status is-interactive; and pyenv init - | source" >> ~/.config/fish.config.fish

# Virtualenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
python -m pip install --user virtualenv

# Powerline fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

# Fish config
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
set -g -x PATH /usr/local/bin $PATH # fish
fish_update_completions
set -U fish_user_paths $fish_user_paths /Users/nsorros/.local/bin # fish
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
curl http://ethanschoonover.com/solarized/files/solarized.zip

omf theme install agnoster

