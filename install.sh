#!/bin/bash
# ---------------------------------------------------
# Creator: dark gaara
# Theme Name: ModxRahulz (Pro & Crash-Proof Edition)
# ---------------------------------------------------

# 1. User se unka custom naam poochna (with short name tip)
echo -e "\e[1;36m=========================================\e[0m"
echo -e "\e[1;32m       ★ ModxRahulz Theme Setup ★\e[0m"
echo -e "\e[1;36m=========================================\e[0m"
echo ""
read -p "Apna Custom Banner Name likhein (Max 10 letters, Default 'ModxRahulz' ke liye ENTER): " USER_NAME

# Agar user khali chhod kar enter dabata hai, toh default naam ModxRahulz set ho jayega
if [ -z "$USER_NAME" ]; then
    USER_NAME="ModxRahulz"
fi

# 2. Termux ko update karna aur zaroori tools install karna
echo -e "\e[1;32m[+] Packages update ho rahe hain...\e[0m"
pkg update -y && pkg upgrade -y
pkg install git zsh figlet -y

# 3. Auto-suggestions & Syntax Highlighting plugins download karna
echo -e "\e[1;36m[+] Plugins set up ho rahe hain...\e[0m"
mkdir -p ~/.zsh-plugins
rm -rf ~/.zsh-plugins/zsh-autosuggestions ~/.zsh-plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh-plugins/zsh-syntax-highlighting

# 4. Custom configuration file (.zshrc) banana
echo -e "\e[1;33m[+] Neon theme config apply ho rahi hai...\e[0m"

cat << EOF > ~/.zshrc
# ---------------------------------------------------
# Creator: dark gaara
# Theme Name: ModxRahulz
# ---------------------------------------------------

# --- History System (Exit ke baad bhi commands yaad rakhne ke liye) ---
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

# Start hote hi screen aur scrollback buffer dono ko completely clean karna
printf "\e[H\e[2J\e[3J"

# Custom Neon Header (Figlet tool ka use karke)
echo -e "\e[1;36m"
figlet "$USER_NAME"
echo -e "\e[0m"
echo -e "\e[1;31m  ★ Creator: dark gaara ★\e[0m"
echo -e "\e[1;33m--------------------------------------------------------\e[0m"
echo -e ""

# Custom Prompt jisme user ka chuna hua naam aur current folder aayega
PROMPT='%F{cyan}%Btermux@$USER_NAME%b%f:%F{magenta}%B%~%b%f%F{green} ❯%f '
EOF

# 5. Default shell ko badal kar zsh karna (Syntax error fixed)
chsh -s zsh

echo ""
echo -e "\e[1;32m[+] Installation poori ho gayi hai aur Theme Super-Optimized hai!\e[0m"
echo -e "\e[1;33m[+] Apna naya custom banner dekhne ke liye Termux ko ek baar EXIT karke dubara kholein.\e[0m"
