# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in thebash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
marker_file=~/.utils_ok
host1="1.1.1.1"
host2="google.fr"

if [ -f "$marker_file" ]; then
  echo "Mise à jour des outils déjà faite."
else
  touch "$marker_file"
  apt install -y neofetch mailutils figlet dnsutils net-tools lm-sensors nodejs npm
  cd ~
  wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.10.2/fastfetch-linux-amd64.deb
  dpkg -i fastfetch-linux-amd64.deb
  npm install --global fast-cli
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias maj='apt update && apt full-upgrade -y && apt autoremove -y'
alias sp='source .profile'
alias ep='nano .profile'

clear
fastfetch
alias disk="df -h 2>/dev/null | grep '/$' | sed -e 's/ /:/g' | sed -e 's/::/:/g' | sed -e 's/::/:/g'| sed -e 's/::/:/g'"

echo "Bienvenue sur : $(hostname -f) ($(hostname -I)) !"
echo "******************************************************"
echo "Note: Toutes actions sur ce serveur sont enregistrees."
echo "------------------------------------------------------"
echo -e "Date d'installation : $(stat / | grep "Birth" | sed 's/Birth: //g' | cut -b 2-11)"

ping -c 1 "$host1" > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo -e "\033[0;31mAucune connexion Internet n'est disponible.\033[0m"
else
  nslookup "$host2" > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo -e "\033[0;31mAucune connexion DNS n'est disponible.\033[0m"
  else
    echo -e "\033[0;32mConnexion à internet : OK.\033[0m"  
  fi 
fi

# Mettre à jour la liste des paquets disponibles
apt-get update > /dev/null

# Obtenir la liste des mises à jour disponibles
updates=$(apt list --upgradable 2>/dev/null | grep -v Listing)

if [[ -z "$updates" ]]; then
    echo -e "\e[32mAucune mise à jour disponible.\e[0m"  # Affiche en vert s'il n'y a pas de mise à jour
else 
  # Compter les mises à jour de sécurité
  security_updates_count=$(echo "$updates" | grep -e "\s\(security\|sécurité\)\s" | wc -l)
  
  # Compter les autres mises à jour
  other_updates_count=$(echo "$updates" | grep -v -e "\s\(security\|sécurité\)\s" | wc -l)

  if [[ $security_updates_count -gt 0 || $other_updates_count -gt 0 ]]; then
      echo -e "\e[31mNombre de mises à jour de sécurité disponibles : $security_updates_count\e[0m"  # Affiche en rouge si des mises à jour sont disponibles
      echo -e "\e[31mNombre d'autres mises à jour disponibles : $other_updates_count\e[0m"  # Affiche en rouge si des mises à jour sont disponibles
  else
      echo -e "\e[32mAucune mise à jour disponible.\e[0m"  # Affiche en vert s'il n'y a pas de mise à jour
  fi
fi

# Utiliser sensors pour obtenir les informations de température
temp_info=$(sensors)

# Extraire la température du système (généralement associée au processeur ou au package thermique)
system_temp=$(echo "$temp_info" | grep "Package" | awk '{print $4}')

# Vérifier si la température du système est disponible
if [[ -z "$system_temp" ]]; then
    echo "Impossible de récupérer la température du système."
else 
    # Extraire la partie numérique de la température (en enlevant le °C et le décimal)
    system_temp_int=$(echo "$system_temp" | tr -d '.°C')

    # Déterminer la couleur en fonction de la température
    if [[ $system_temp_int -gt 550 ]]; then
       color='\e[31m'  # Rouge pour température > 55°C
    elif [[ $system_temp_int -ge 350 && $system_temp_int -le 540 ]]; then
       color='\e[32m'  # Vert pour température entre 35°C et 54°C
    else
       color='\e[34m'  # Bleu pour température < 35°C
    fi

    # Afficher la température du système avec la couleur appropriée
    echo -e "Température du système : ${color}${system_temp}\e[0m"
fi
cd ~
# Disk : Verification de l'espace restant
#FD=$(echo $(df -h 2>/dev/null | grep '/$' | sed -e 's/ /:/g' | sed -e 's/::/:/g' | sed -e 's/::/:/g'| sed -e 's/::/:/g' | cut -d ':' -f5)| cut -d '%' -f1)
#[ $FD -lt $MaxHDUse ] && libre="\e[01;32;7m $FD% \e[0m" || libre="\e[41;37;5m $FD% \e[0m"
#echo -e "Disk    : $(df -h 2>/dev/null | grep '/$' | sed -e 's/ /:/g' | sed -e 's/::/:/g' | sed -e 's/::/:/g'| sed -e 's/::/:/g' | cut -d ':' -f3) / $(df -h 2>/dev/null | grep '/$' | sed -e 's/ /:/g' | sed -e 's/::/:/g' | sed -e 's/::/:/g'| sed -e 's/::/:/g' | cut -d ':' -f4)"

# Verification des services Web
#pidof "pihole-FTL" >/dev/null && echo -e "Pihole-FTL: \e[01;32;7m Service actif \e[0m" || echo -e "Pihole-FTL : \e[41;37;5m Service inactif \e[0m"
#pidof "lighttpd" >/dev/null && echo -e "Lighttpd  : \e[01;32;7m Service actif \e[0m" || echo -e "Lighttpd : \e[41;37;5m Service inactif \e[0m"
#pidof "mariadbd" >/dev/null && echo -e "MariaDB : \e[01;32;7m Service actif \e[0m" || echo -e "MariaDB : \e[41;37;5m Service inactif \e[0m"
#pidof "apache2" >/dev/null && echo -e "Apache2 : \e[01;32;7m Service actif \e[0m" || echo -e "Apache2 : \e[41;37;5m Service inactif \e[0m"
# Vérification des agents
#pidof "fusioninventory" >/dev/null && echo -e "Fusion  : \e[01;32;7m Service actif \e[0m" || echo -e "Fusion  : \e[41;37;5m Service inactif \e[0m"
# Verification des services Proxmox
#pidof "pvedaemon" >/dev/null && echo -e "PVE      : \e[01;32;7m Service actif \e[0m" || echo -e "PVE       : \e[41;37;5m Service inactif \e[0m"
#pidof "pveproxy" >/dev/null && echo -e "PVE-Proxy: \e[01;32;7m Service actif \e[0m" || echo -e "PVE-Proxy: \e[41;37;5m Service inactif \e[0m"
# Vérification du serveur de temps
#pidof "ntpd" >/dev/null && echo -e "NTP      : \e[01;32;7m Service actif \e[0m" || echo -e "NTP      : \e[41;37;5m Service inactif \e[0m"

# Envoie du mail d'alertes de connexion.
echo "Merci de vérifier que vous êtes bien à l'originie de cette connexion." | mail -s "Connexion sur : $HOSTNAME avec le compte : $USER" admin@h3campus.fr
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
figlet H3 Campus
