# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi


mesg n || true


##########################################################
#                Custom Profile
##########################################################

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h \[\033[01;32m\]\w\[\033[00m\]\$ '
MaxHDUse=80

#$mail=mail@mail.fr 

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
echo "Date    : $(date) "
echo "Uptime  : $(uptime -p)"
echo "Temp    : $(cat  /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_input|sed 's/\(.\)..$/.\1°C/')"


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

# Envoie du mail d'alertes de connexion.
#echo "Merci de vérifier que vous êtes bien à l'origine de cette connexion." | mail -s "Connexion sur : $HOSTNAME avec le compte : $USER" $mail

