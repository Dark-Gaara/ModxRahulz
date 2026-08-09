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
read -p "Enter your Custom Banner Name (Max 10 chars, Press ENTER for 'ModxRahulz'): " USER_NAME

# Set default name if user leaves it blank
if [ -z "$USER_NAME" ]; then
    USER_NAME="ModxRahulz"
fi

# 2. Update and Install Dependencies (Switched to figlet for smooth fonts)
echo -e "\e[1;32m[+] Updating packages...\e[0m"
pkg update -y && pkg upgrade -y
pkg install git zsh figlet ncurses-utils -y

# 3. Download ZSH Plugins
echo -e "\e[1;36m[+] Setting up ZSH plugins...\e[0m"
mkdir -p ~/.zsh-plugins
rm -rf ~/.zsh-plugins/zsh-autosuggestions ~/.zsh-plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh-plugins/zsh-syntax-highlighting

# 4. Generate Centered Configuration
echo -e "\e[1;33m[+] Applying Smooth Centered Configuration...\e[0m"

cat << EOF > ~/.zshrc
# ---------------------------------------------------
# Creator: dark gaara
# Theme Name: ModxRahulz
# ---------------------------------------------------

# --- Smart History System ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history share_history inc_append_history

# --- Termux Scrollback Buffer Fix ---
alias clear='printf "\e[H\e[2J\e[3J"'

# --- Safe Plugin Loading ---
if [ -f ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
fi

if [ -f ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Deep clean screen on startup
printf "\e[H\e[2J\e[3J"

# ---------------------------------------------------
# Smart Centering Function
# ---------------------------------------------------
center_print() {
    awk -v cols=\$(tput cols) '{ pad=int((cols-length(\$0))/2); if(pad<0)pad=0; printf "%*s%s\n", pad, "", \$0 }'
}

# Print Centered Banner (Cyan - Smooth Slant Font)
printf "\e[1;36m"
figlet -f slant "$USER_NAME" | center_print

# Print Centered Subtitle (Red)
printf "\e[1;31m"
echo "★ Creator: dark gaara ★" | center_print

# Print Centered Separator (Yellow)
printf "\e[1;33m"
echo "------------------------------" | center_print

# Reset Colors
printf "\e[0m\n"

# Custom Prompt
PROMPT='%F{cyan}%Btermux@$USER_NAME%b%f:%F{magenta}%B%~%b%f%F{green} ❯%f '
EOF

# 5. Safe Shell Change
chsh -s zsh

echo ""
echo -e "\e[1;32m[+] Installation completed successfully!\e[0m"
echo -e "\e[1;33m[+] Please type 'exit' and restart Termux to see the smooth theme.\e[0m"
