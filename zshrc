# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/Johnny/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



#Alias
alias maj='sudo apt update && sudo apt upgrade -y && apt autoremove -y && sudo apt-get check'
alias apt="sudo apt"
alias sb="source ~/.bashrc"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias dps="docker ps -a"
alias cputemp="paste <(cat /sys/class/thermal/thermal_zone0/type) <(cat /sys/class/thermal/thermal_zone0/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/'"
alias sz="source ~/.zshrc"
alias qn="qownnotes"
alias ez="nano ~/.zshrc"
alias speedo="speedometer -r wlan0 -i 1"
alias spt="/usr/bin/speedtest"
alias vpnparis="sudo apt >/dev/null ; sudo openfortivpn -c /etc/openfortivpn/paris --persistent=120 & ;"
alias vpnpoissy="sudo apt >/dev/null; sudo openfortivpn -c /etc/openfortivpn/poissy --persistent=120 & ;"
alias vpnissy="sudo apt >/dev/null; sudo openfortivpn -c /etc/openfortivpn/issy --persistent=120 & ;"
alias publicip="curl ipecho.net/plain"
alias sshkey="eval `ssh-agent` ; ssh-add /home/Johnny/.ssh/tuxgyver "
alias sshaddkey="ssh-add /home/Johnny/.ssh/tuxgyver_key"
alias majinfo="cd ~/Documents/Web/ ; scp -r -P 2222 * root@192.168.150.213:/var/www/html/"
alias majinfo2="cd ~/Documents/Web/ ; scp -r * root@192.168.180.213:/var/www/html/"
alias killvpn="sudo killall openfortivpn ; echo 'Tous les openvpn ont ete kille !'"
alias p1="ping 192.168.150.1"
alias p1.8="ping 192.168.150.8"
alias p1.12="ping 192.168.150.12"
alias p1.210="ping 192.168.150.210"
alias p1.214="ping 192.168.150.214"
alias p1.215="ping 192.168.150.215"
alias p1.216="ping 192.168.150.216"
alias p1.213="ping 192.168.150.213"
alias p1.220="ping 192.168.150.220"
alias p1.227="ping 192.168.150.227"
alias p1.230="ping 192.168.150.230"
alias p2="ping 192.168.156.1"
alias p2.8="ping 192.168.156.8"
alias p2.210="ping 192.168.150.210"
alias p2.215="ping 192.168.150.215"
alias p2.227="ping 192.168.156.227"
alias p3="ping 192.168.1.254"
alias p3.8="ping 192.168.1.8"
alias p3.227="ping 192.168.7.227"
alias ka="sudo killall anydesk"
alias scan-allports="sudo nmap -sTV -p1-65535 "
alias scan-port="sudo nmap -sTV -p21,22,53,80,139,443,445,2222,4343,8006,8007,5900,8080,8443,10000,19999 "
alias scan-rapide="sudo nmap -sPV "
alias scan-malware='sudo maldet --scan-all '
alias lt='ls --human-readable --size -1 -S --classify'
alias powershell='docker run -it clowa/powershell-core'
alias meteo-meudon='curl wttr.in/meudon'
alias meteo-paris='curl wttr.in/paris'
alias meteo-valbonnais='curl wttr.in/valbonnais'



# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



clear
neofetch
alias disk="df -h 2>/dev/null | grep '/$' | sed -e 's/ /:/g' | sed -e 's/::/:/g' | sed -e 's/::/:/g'| sed -e 's/::/:/g'"
MaxHDUse=75

echo "Bienvenue sur : $(hostname -f) ($(hostname -I)) !"
echo "******************************************************"
echo "Note: Toutes actions sur ce serveur sont enregistrees."
echo "------------------------------------------------------"
echo "Date    : $(date) "
echo "Uptime  : $(uptime -p)"
echo "Temp.   : $(paste <(cat /sys/class/thermal/thermal_zone0/type) <(cat /sys/class/thermal/thermal_zone0/temp) | column -s $'  ' -t | sed 's/\(.\)..$/.\1°C/')"


# Disk : Verification de l'espace restant
FD=$(echo $(disk | cut -d ':' -f5)| cut -d '%' -f1)
[ $FD -lt $MaxHDUse ] && libre="\e[01;32;7m $FD% \e[0m" || libre="\e[41;37;5m $FD% \e[0m"
echo -e "Disk    : Use->$(disk | cut -d ':' -f3) / Free->$(disk | cut -d ':' -f4) (Use: $libre)"

# Verification des services Web
#pidof "mysqld" >/dev/null && echo -e "MariaDB : \e[01;32;7m Service actif \e[0m" || echo -e "MariaDB : \e[41;37;5m Service inactif \e[0m"
#pidof "apache2" >/dev/null && echo -e "Apache2 : \e[01;32;7m Service actif \e[0m" || echo -e "Apache2 : \e[41;37;5m Service inactif \e[0m"
#pidof "fusioninventory" >/dev/null && echo -e "Fusion  : \e[01;32;7m Service actif \e[0m" || echo -e "Fusion  : \e[41;37;5m Service inactif \e[0m"
# Verification des services Proxmox
#pidof "pvedaemon" >/dev/null && echo -e "PVE      : \e[01;32;7m Service actif \e[0m" || echo -e "PVE       : \e[41;37;5m Service inactif \e[0m"
#pidof "pveproxy" >/dev/null && echo -e "PVE-Proxy: \e[01;32;7m Service actif \e[0m" || echo -e "PVE-Proxy: \e[41;37;5m Service inactif \e[0m"
# Vérification du serveur de temps
#pidof "ntpd" >/dev/null && echo -e "NTP     : \e[01;32;7m Service actif \e[0m" || echo -e "NTP     : \e[41;37;5m Service inactif \e[0m"
# Vérification du serveur CUPS
#pidof "avahi-daemon" >/dev/null && echo -e "CUPS    : \e[01;32;7m Service actif \e[0m" || echo -e "CUPS    : \e[41;37;5m Service inactif \e[0m"


transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

# Tuxtech.fr
figlet Tuxtech.fr

