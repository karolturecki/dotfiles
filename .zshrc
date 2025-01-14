# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
source $ZSH/oh-my-zsh.sh

# Zsh Syntax Highlighting
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Ensure z is sourced
if [ -f /usr/share/z/z.sh ]; then
    source /usr/share/z/z.sh
elif [ -f ~/z/z.sh ]; then
    source ~/z/z.sh
fi

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

# Aliases
alias system-upgrade="sudo pacman -Scc --noconfirm; paru -Scc --noconfirm; yes | paru; paru -Qq | grep '\-git' | paru -S -; sudo pacman -Scc --noconfirm; paru -Scc --noconfirm; rustup update"
alias vencord-upgrade='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias c='clear;fastfetch' # Clear terminal & shows fastfetch
alias ls='eza --icons' # Use eza with icons
alias ll='eza -lha --icons --sort=name --group-directories-first' # Detailed list with icons

# Add custom PATH
export PATH=$PATH:/home/karol/.spicetify

# Colors for ls (if needed for other tools)
export LS_COLORS="di=1;34:fi=0;32:ln=1;36:*.sh=1;31:*.md=1;35"

# Display system info at start
fastfetch

# Command not found handler
function command_not_found_handler() {
    echo -e "Komendy \e[91m$1\e[0m nie rozpoznano!" >&2
    return 127
}

# Enhanced cd function
function cd() {
    builtin cd "$@" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo -e "Katalog \e[91m$*\e[0m nie istnieje."
        return 1
    fi
    ls
}




# Prompt customization
PS1='%F{cyan}%n@%f %F{yellow}%~%f ➜ '



