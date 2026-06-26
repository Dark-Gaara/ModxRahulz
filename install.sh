#!/bin/bash
# ---------------------------------------------------
# Creator: dark gaara
# Theme Name: ModxRahulz
# ---------------------------------------------------

# Termux ko update karna aur zsh install karna
echo -e "\e[1;32m[+] Packages update ho rahe hain...\e[0m"
pkg update -y && pkg upgrade -y
pkg install git zsh -y

# Auto-suggestions plugin ko download karna
echo -e "\e[1;36m[+] Auto-suggestions set up ho raha hai...\e[0m"
mkdir -p ~/.zsh-plugins
rm -rf ~/.zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions

# Custom configuration file (.zshrc) banana
echo -e "\e[1;33m[+] Neon theme config apply ho rahi hai...\e[0m"
cat << 'EOF' > ~/.zshrc
# ---------------------------------------------------
# Creator: dark gaara
# Theme Name: ModxRahulz
# ---------------------------------------------------

# Auto-suggestions ko chalu karna
source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8' # Dark Neon Grey suggestion color

# Screen ko har baar clear karke top par header dikhana
clear

# Neon Header: ModxRahulz (Fixed bold 'x' aur perfectly aligned)
echo -e "\e[1;36m   __  __           _               _____       _           _     \e[0m"
echo -e "\e[1;36m  |  \\/  |         | |             |  __ \\     | |         | |    \e[0m"
echo -e "\e[1;32m  | \\  / | ___   __| | \\ \\/ /      | |__) |__ _| |__  _   _| |___ \e[0m"
echo -e "\e[1;32m  | |\\/| |/ _ \\ / _\` |  >  <       |  _  // _\` | '_ \\| | | | |_  /\e[0m"
echo -e "\e[1;35m  | |  | | (_) | (_| | / /\\ \\      | | \\ \\ (_| | | | | |_| | |/ / \e[0m"
echo -e "\e[1;35m  |_|  |_|\\___/ \\__,_|/_/  \\_\\     |_|  \\_\\__,_|_| |_|\\__,_|_/___|\e[0m"
echo -e ""
echo -e "\e[1;31m  ★ Creator: dark gaara ★\e[0m"
echo -e "\e[1;33m--------------------------------------------------------\e[0m"
echo -e ""

# Neon Custom Prompt
PROMPT='%F{cyan}%Btermux@ModxRahulz%b%f:%F{magenta}%B~%b%f%F{green} ❯%f '
EOF

# Default shell ko badal kar zsh karna
chsh -s zsh

echo -e "\e[1;32m[+] Installation poori ho gayi hai aur Banner fix ho gaya hai!\e[0m"
echo -e "\e[1;33m[+] Naya banner dekhne ke liye Termux ko band karke dubara kholein.\e[0m"
