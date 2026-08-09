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

# Badge ke liye naam ko Uppercase (Bade aksharon) mein convert karna
BADGE_NAME=$(echo "$USER_NAME" | tr '[:lower:]' '[:upper:]')

# 2. Update and Install Dependencies (Figlet/Toilet hata diye gaye hain fast install ke liye)
echo -e "\e[1;32m[+] Updating packages...\e[0m"
pkg update -y && pkg upgrade -y
pkg install git zsh ncurses-utils -y

# 3. Download ZSH Plugins
echo -e "\e[1;36m[+] Setting up ZSH plugins...\e[0m"
mkdir -p ~/.zsh-plugins
rm -rf ~/.zsh-plugins/zsh-autosuggestions ~/.zsh-plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh-plugins/zsh-syntax-highlighting

# 4. Generate Badge and Config
echo -e "\e[1;33m[+] Applying Modern Cyberpunk Configuration...\e[0m"

# Badge ka perfect rectangle size calculate karna
BADGE_TEXT="[ $BADGE_NAME ]"
TEXT_LEN=${#BADGE_TEXT}
TOTAL_WIDTH=$((TEXT_LEN + 12)) # Box ki chodaayi
EMPTY_LINE=$(printf "%*s" $TOTAL_WIDTH "")
TEXT_LINE=$(printf "%6s%s%6s" "" "$BADGE_TEXT" "")

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
# Smart Centering Engines
# ---------------------------------------------------
center_badge() {
    awk -v cols=\$(tput cols) '{ pad=int((cols-length(\$0))/2); if(pad<0)pad=0; printf "%*s\033[46;1;30m%s\033[0m\n", pad, "", \$0 }'
}

center_text() {
    awk -v cols=\$(tput cols) '{ pad=int((cols-length(\$0))/2); if(pad<0)pad=0; printf "%*s%s\n", pad, "", \$0 }'
}

echo ""

# Print 100% Solid & Smooth Cyan Badge
echo "$EMPTY_LINE" | center_badge
echo "$TEXT_LINE" | center_badge
echo "$EMPTY_LINE" | center_badge

echo ""

# Print Centered Subtitle (Red)
printf "\e[1;31m"
echo "★ Creator: dark gaara ★" | center_text

# Print Centered Separator (Yellow)
printf "\e[1;33m"
echo "------------------------------" | center_text

# Reset Colors
printf "\e[0m\n"

# Custom Prompt (Original normal size name)
PROMPT='%F{cyan}%Btermux@$USER_NAME%b%f:%F{magenta}%B%~%b%f%F{green} ❯%f '
EOF

# 5. Safe Shell Change
chsh -s zsh

echo ""
echo -e "\e[1;32m[+] Installation completed successfully!\e[0m"
echo -e "\e[1;33m[+] Please type 'exit' and restart Termux to see the Modern Badge theme.\e[0m"
