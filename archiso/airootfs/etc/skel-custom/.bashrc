#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
    screen*)
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
        ;;
esac

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias df='df -h'                          
alias free='free -m'                      

alias ..='cd ..'
alias ...='cd ../..'

alias updatedb='sudo pacman -Sy'

# Actualizar todo el sistema (sin preguntas)
alias upgrade='sudo pacman -Syu --noconfirm'

# Limpiar toda la caché de paquetes (pregunta antes)
alias clean-cache='sudo pacman -Sc'

# Limpiar toda la caché sin preguntas (más agresivo)
alias clean-cache-all='sudo pacman -Scc --noconfirm'

# Buscar paquetes (alias para pacman -Ss)
alias search='pacman -Ss'

# Mostrar info de paquete
alias pkginfo='pacman -Qi'

# Mostrar paquetes instalados
alias installed='pacman -Qe'

PS1='\[\e[38;5;67m\]\u\[\e[0m\]@\h \[\e[38;5;67m\]\W \[\e[0m\]\$ '
