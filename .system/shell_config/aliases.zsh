# my custom aliases
# -----------------


# alternative to the "pwd" command. only for fun...
alias cwd='python $HOME/.system/python_scripts/Get_Path.py'


# get only the files in the current directory
alias f='python $HOME/.system/python_scripts/Get_Files.py'


# get only directorys
alias dr='python $HOME/.system/python_scripts/Get_Directorys.py'


# cd git
alias goblog='cd $HOME/Desktop/git/nachmenkurtz.github.io'


# git actions (add, commit, push)
alias togit='$HOME/.system/shell_scripts/git-actions.sh'

# simple script for git actions, no show list of repo's.
alias gogitsim='$HOME/.system/shell_scripts/git-action-simple.sh'


# start the script copy new podcast
alias copyp='$HOME/.system/shell_scripts/copy-podcast.sh'


# read the copyed podcasts in mp3 device
alias rcopyp='ls /run/media/nachmen/9C33-6BBD/gPodder/"$(date +'%d-%m-%y')" | nl'


# read the dnf update log
alias cupd='cat $HOME/Desktop/dnf-update-logs/"$(date +'%d-%m-%y')"'


# read and run update and upgrade for dnf packages
alias crup='cupd && upg'


# upgrade dnf packages
alias upg='sudo dnf upgrade'


# check update and write there to log file
alias sdcu='sudo dnf check-update >> $HOME/.system/logs/dnf/$TIME_DATE'


# read .zshrc file
alias cz='cat $HOME/.zshrc'


alias bz='bat $HOME/.zshrc'


# edit .zshrc file
alias ez="e $HOME/.zshrc"


# reload .zshrc file
alias soz='source $HOME/.zshrc'


# open the gnome browser - "epiphany"
alias gweb='epiphany'


# copy html he template her.
alias html='cp $HOME/Templates/he.html .'


# prompt before every remova file
alias irm='rm -i'


# copy backgrounds
alias cb='$HOME/.system/shell_scripts/background.sh'


# Backup FreshRSS:
alias cfr='$HOME/.system/shell_scripts/Copy_FreshRSS.sh'


# edit files (with default texy editor)
alias e='$EDITOR'


# clear command
alias c='clear'


# exit as x
alias x='exit'


# baobab - A graphical disk usage analyzer for the GNOME desktop
# alias dua='baobab'


# Show status exit code in the Shell:
alias q='echo $?'


# cd directory to the temporory directory
alias t='cd $HOME/.tmp'


# best tree view forfile system
alias tr='eza -T --icons'


# move new podcast
alias mvpod='$HOME/.system/shell_scripts/mv_new_pod_from_malam.sh'


alias bz='bat $HOME/.zshrc'


alias cat=bat


alias copyp2='$HOME/.system/shell_scripts/copy-podcast_2_day.sh'


alias d=docker


alias ez='e /home/nachmen/.zshrc'


alias pm=podman


alias te=gnome-text-editor


alias tf=terraform


alias chp='$HOME/.system/shell_scripts/Check_for_SanDisk_player.sh'


alias pod1='/home/nachmen/.system/shell_scripts/what_is_the_new_podcast_1_days.sh'


alias pod2='/home/nachmen/.system/shell_scripts/what_is_the_new_podcast_2_days.sh'


alias blabla="genact -m cargo"


alias logvi="tspin"

# Now containers is only Podman
alias docker="podman"
