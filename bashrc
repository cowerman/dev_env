# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

alias rotate_left="xrandr -o left"

#alias share='synergyc -f 10.239.144.207 &'
#alias share='synergy-core --server -f &'


#android studio
export PATH="$PATH:~/.bin/"

#alias of devices
alias ndgserver='ssh  10.239.144.27'
alias dev='adb -s INV140600189'
#export USE_CCACHE=1
#export CCACHE_DIR=~/.ccache
#ccache -M 300G

#code path
#alias rgx='cd ndg-android/vendor/intel/hardware/PRIVATE/rgx/; git branch'
#alias kernel='cd ndg-android/linux/kernel/drivers/external_drivers/intel_media/; git branch'
#alias hwc='cd ndg-android/hardware/intel/img/hwcomposer/merrifield; git branch'
#alias framework='cd ndg-android/frameworks/native/; git branch'
#alias sf='cd ndg-android/frameworks/native/services/surfaceflinger; git branch'
#alias display="cd ndg-android/linux/kernel/drivers/external_drivers/intel_media/display/tng; git branch"

#dumpLayers commend
#alias tmpstart="adb root;sleep 2;adb shell setenforce 0;adb shell touch /data/app/dumpSF"
#alias tmpstop="adb shell rm /data/app/dumpSF&&adb pull /data/app/sfDumpLayers . "
#alias tmpclean="adb shell rm -rf /data/app/sfDumpLayers"
#alias dumpsys="adb shell dumpsys SurfaceFlinger"
#alias loopreboot=" while true;do adb reboot;sleep 90;done"

#adb device alias
#alias dbg='adb -s MedfieldB6F2BC3E'
#alias dxxg="adb root; sleep 2;adb shell 'echo low > /sys/kernel/debug/gpio_debug/gpio190/current_value'; adb logcat | tee 2" 

alias my_compile='rm .config .config.old;make clean &&make allnoconfig && make -j8 && rm .config && make clean&& make allyesconfig && make -j8 && rm .config && make clean && make allmodconfig && make -j8 && make clean && rm .config && echo "Build successfully!"'

alias mouseshare="synergys -f &"
#alias clientserver="ssh lw3968@192.168.0.112"
#alias vpn_set='ssh root@155.138.145.197'
alias vpn_set='ssh root@199.247.17.124'
alias my_server="ssh root@192.168.0.150"

# install croess compile:  sudo apt-get install mingw-w64
# compile standle c file for 64 bit(PE32+ executable (console) x86-64): x86_64-w64-mingw32-gcc sample.c -o a.exe
# compile standle c file for 32 bit(PE32 executable (console) Intel 80386): i686-w64-mingw32-gcc sample1.c -o a.exe
# IDA probe
alias ida_dis='wine64 /root/Downloads/IDA_7_0/ida64.exe'
alias understand='/root/Downloads/scitool/bin/linux64/understand'
alias myserve='ssh root@108.160.137.185'
alias stop="echo 1 > ~/.tflag"
alias sit="python3 ~/lw-dev/true_world/sit_stand.py &"
# .swf playback : flashplayerdebugger
# CPU/GPU temperture: sudo sensor-detect
