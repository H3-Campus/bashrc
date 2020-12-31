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

clear
neofetch
alias disk="df -h | grep dev | sed -e 's/ /:/g' | sed -e 's/::/:/g'"

echo "Bienvenue sur : $(hostname -f) ($(hostname -i)) !"
echo "******************************************************"
echo "Note: Toutes actions sur ce serveur sont enregistrees."
echo "------------------------------------------------------"
echo "Date    : $(date) "
echo "Uptime  : $(uptime -p)"
echo "Disk    : Use->$(disk | cut -d ':' -f3) / Free->$(disk | cut -d ':' -f4) (Use: $(disk | cut -d ':' -f5))"
echo -e "Apache2 : \033[01;32m $(service apache2 status | grep Active | cut -d ' ' -f5,6) \033[01;37m"
echo -e "MariaDB : \033[01;32m $(service mysql  status | grep Active | cut -d ' ' -f5,6) \033[01;37m"
echo ""

