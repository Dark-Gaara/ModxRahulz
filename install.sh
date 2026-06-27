#!/bin/bash
# ---------------------------------------------------
# Creator: dark gaara
# Theme Name: ModxRahulz (Customizable)
# ---------------------------------------------------

# 1. User se unka custom naam poochna
echo -e "\e[1;36m=========================================\e[0m"
echo -e "\e[1;32m       ★ ModxRahulz Theme Setup ★\e[0m"
echo -e "\e[1;36m=========================================\e[0m"
echo ""
# User se naam input lene ka code
read -p "Apna Custom Banner Name likhein (Default 'ModxRahulz' ke liye bas ENTER dabayein): " USER_NAME

# Agar user khali chhod kar enter dabata hai, toh default naam ModxRahulz set ho jayega
if [ -z "$USER_NAME" ]; then
    USER_NAME="ModxRahulz"
fi

# 2. Termux ko update karna aur zaroori tools install karna
echo -e "\e[1;32m[+] Packages update ho rahe hain...\e[0m"
pkg update -y && pkg upgrade -y
# Yahan humne 'figlet' add kiya hai jo normal text ko bade banner mein badalta hai
pkg install git zsh figlet -y

# 3. Auto-suggestions plugin ko download karna
echo -e "\e[1;36m[+] Auto-suggestions set up ho raha hai...\e[0m"
mkdir -p ~/.zsh-plugins
rm -rf ~/.zsh-plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh-plugins/zsh-autosuggestions

# 4. Custom configuration file (.zshrc) banana
echo -e "\e[1;33m[+] Neon theme config apply ho rahi hai...\e[0m"

# Nayi config file generate karna
cat << EOF > ~/.zshrc
# ---------------------------------------------------
# Creator: dark gaara
# Theme Name: ModxRahulz
# ---------------------------------------------------

# Auto-suggestions ko chalu karna
source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Screen ko har baar clear karke top par header dikhana
clear

# Custom Neon Header (Figlet tool ka use karke)
echo -e "\e[1;36m"
figlet "$USER_NAME"
echo -e "\e[0m"
echo -e "\e[1;31m  ★ Creator: dark gaara ★\e[0m"
echo -e "\e[1;33m--------------------------------------------------------\e[0m"
echo -e ""

# Custom Prompt jisme user ka chuna hua naam aayega
PROMPT='%F{cyan}%Btermux@$USER_NAME%b%f:%F{magenta}%B%~%b%f%F{green} ❯%f '
EOF

# 5. Default shell ko badal kar zsh karna
chsh -s zsh

echo ""
echo -e "\e[1;32m[+] Installation poori ho gayi hai!\e[0m"
echo -e "\e[1;33m[+] Apna naya custom banner dekhne ke liye Termux ko ek baar EXIT karke dubara kholein.\e[0m"
