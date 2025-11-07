

GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color


if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "${GREEN}oh-my-zsh is installed${NC}"
else
  echo "oh-my-zsh is not installed"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ln -s zsh/zshrc ~/.zshrc
fi


if command -v nvim >/dev/null 2>&1; then
  echo "${GREEN}NEOVIM is installed${NC}"
else
  echo "${RED}Neovim is not installed${NC}"
  read -p "Do you want to install Neovim? (y/n): " choice
  case "$choice" in
    y|Y )
      echo "Installing NEOVIM"
      brew install neovim
      ;;
    * )
      echo "Skipping installation."
      ;;
   esac
fi


if command -v pyenv >/dev/null 2>&1; then
  echo "${GREEN}PYENV is installed${NC}"
else
  echo "${RED}PYENV is not installed${NC}"
  read -p "Do you want to install PYENV? (y/n): " choice
  case "$choice" in
    y|Y )
      echo "Installing PYENV"
      brew install pyenv
      ;;
    * )
      echo "Skipping installation."
      ;;
   esac
fi

## mv ~/.zshrc ~/.zshrc.old
ln -s "$(pwd)/zsh/zshrc" ~/.zshrc
ln -s "$(pwd)/tmux/tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/nvim" ~/.config/nvim
touch ~/.variables.env








