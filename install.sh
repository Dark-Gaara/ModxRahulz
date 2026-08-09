#!/bin/bash
# ---------------------------------------------------
# Creator: dark gaara
# Theme Name: ModxRahulz
# ---------------------------------------------------

# 1. Custom Name Prompt
echo -e "\e[1;36m=========================================\e[0m"
echo -e "\e[1;32m       ★ ModxRahulz Theme Setup ★\e[0m"
echo -e "\e[1;36m=========================================\e[0m"
echo ""
read -p "Enter your Custom Banner Name (Max 10 letters, Press ENTER for 'ModxRahulz'): " USER_NAME

# Set default name if user leaves it blank
if [ -z "$USER_NAME" ]; then
    USER_NAME="ModxRahulz"
fi

# 2. Update and Install Dependencies
echo -e "\e[1;32m[+] Updating packages...\e[0m"
pkg update -y && pkg upgrade -y
# Replaced 'figlet' with 'toilet' for solid block letters
pkg install git zsh toilet -y

# 3. Download Auto-suggestions & Syntax Highlighting plugins
echo -e "\e[1;36m[+] Setting up ZSH plugins...\e[0m"
mkdir -p ~/.zsh-plugins
rm -rf ~/.zsh-plugins/zsh-autosuggestions ~/.zsh-plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh-plugins/zsh-syntax-highlighting

# 4. Generate custom configuration file (.zshrc)
echo -e "\e[1;33m[+] Applying Professional Neon configuration...\e[0m"

cat << EOF > ~/.zshrc
# ---------------------------------------------------
# Creator: dark gaara
# Theme Name: ModxRahulz
# ---------------------------------------------------

# --- Smart History System ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt inc_append_history
# ----------------------------------------------------------------------

# --- Termux Scrollback Buffer Fix ---
alias clear='printf "\e[H\e[2J\e[3J"'
# ------------------------------------

# --- Safe Plugin Loading (Error-Proof) ---
if [ -f ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
fi

if [ -f ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# -----------------------------------------

# Deep clean screen on startup
printf "\e[H\e[2J\e[3J"

# Solid Neon Header (Using 'toilet' with 'smblock' for filled text)
echo -e "\e[1;36m"
toilet -f smblock "$USER_NAME"
echo -e "\e[0m"
echo -e "\e[1;31m  ★ Creator: dark gaara ★\e[0m"
echo -e "\e[1;33m--------------------------------------------------------\e[0m"
echo -e ""

# Custom Prompt
PROMPT='%F{cyan}%Btermux@$USER_NAME%b%f:%F{magenta}%B%~%b%f%F{green} ❯%f '
EOF

# 5. Safe Shell Change
chsh -s zsh

echo ""
echo -e "\e[1;32m[+] Installation completed successfully!\e[0m"
echo -e "\e[1;33m[+] Please type 'exit' and restart Termux to see the new theme.\e[0m"
