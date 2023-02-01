# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
marker_file=~/.utils_ok

if [ -f "$marker_file" ]; then
  echo "Mise à jour des outils déjà faite."
else
  touch "$marker_file"
  apt install -y neofetch mailutils figlet
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
neofetch
alias disk="df -h 2>/dev/null | grep '/$' | sed -e 's/ /:/g' | sed -e 's/::/:/g' | sed -e 's/::/:/g'| sed -e 's/::/:/g'"

echo "Bienvenue sur : $(hostname -f) ($(hostname -I)) !"
echo "******************************************************"
echo "Note: Toutes actions sur ce serveur sont enregistrees."
echo "------------------------------------------------------"
updates=$(apt-get upgrade --dry-run --only-security 2> /dev/null | grep ^Inst | wc -l)
if [ $updates -gt 0 ]; then
  echo -e "\033[0;31mIl y a $updates mises à jour de sécurité en attente.\033[0m"
else
  echo -e "\033[0;32mIl n'y a pas de mises à jour de sécurité en attente.\033[0m"
fi
updates=$(apt-get upgrade --dry-run 2> /dev/null | grep ^Inst | wc -l)
if [ $updates -gt 0 ]; then
  echo -e "\033[0;31mIl y a $updates mises à jour en attente.\033[0m"
else
  echo -e "\033[0;32mIl n'y a pas de mises à jour en attente.\033[0m"
fi

echo "Temp    : $(cat /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp2_input|sed 's/\(.\)..$/.\1°C/')"
# Disk : Verification de l'espace restant
FD=$(echo $(df -h 2>/dev/null | grep '/$' | sed -e 's/ /:/g' | sed -e 's/::/:/g' | sed -e 's/::/:/g'| sed -e 's/::/:/g' | cut -d ':' -f5)| cut -d '%' -f1)
#[ $FD -lt $MaxHDUse ] && libre="\e[01;32;7m $FD% \e[0m" || libre="\e[41;37;5m $FD% \e[0m"
echo -e "Disk    : Use->$(df -h 2>/dev/null | grep '/$' | sed -e 's/ /:/g' | sed -e 's/::/:/g' | sed -e 's/::/:/g'| sed -e 's/::/:/g' | cut -d ':' -f3) / Free->$(df -h 2>/dev/null | grep '/$' | sed -e 's/ /:/g' | sed -e 's/::/:/g' | sed -e 's/::/:/g'| sed -e 's/::/:/g' | cut -d ':' -f4) (Use: $libre)"

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
figlet H3-Campus
