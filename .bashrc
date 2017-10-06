#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# git branch info
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
  }

PS1="\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\][\u@\h \W]\n\$ "

eval $(keychain --quiet --eval ~/.ssh/LFO-key)
eval $(keychain --quiet --eval ~/.ssh/portaclown-slimbox)
eval "$(rbenv init -)"
eval "$(hub alias -s)"

export EDITOR=vim                           #sets vim as default
export BROWSER=firefox                      #sets FF as default
export VAGRANT_DEFAULT_PROVIDER=virtualbox  #helps vagrant work
export GITHUB_URL=https://gh.leapfrogonline.net/ #for ruby gist gem with enterprise github
export PATH="$HOME/bin:$PATH"               #adds local scripts
export PATH="$HOME/.rbenv/bin:$PATH"        #allows rbenv to work
set bell-style visible

if [ -f /etc/bash_completion.d/hub.bash_completion.sh ]; then
      . /etc/bash_completion.d/hub.bash_completion.sh
fi

#makes color output default for ls
alias ls='ls --color=auto'

#open vim with nerdtree
alias vimd="vim -c NERDTree"

#open calcurse with orgmode
alias CAL="VISUAL='vim -c \"setl filetype=org\"' PAGER=vim calcurse"

#open lynx using home config
alias lynx="lynx -cfg=~/.config/lynx/lynx.cfg"

#restart powerline
alias repower="powerline-daemon -k; sleep 2; powerline-daemon -q"

#git add changed files and commit in one
function got() {
  if [ -z ${1+x} ]; then
    echo "add a message for the commit 'got \"something\"'"
  else
    branch = $(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/')
    git add . && git commit -m "$1" && git push $(whoami) $branch
  fi
}

#some perl junk
PATH="/home/jleigh/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/jleigh/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jleigh/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jleigh/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jleigh/perl5"; export PERL_MM_OPT;

#some powerline stuff
#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  THEME_PROMPT_SEPARATOR=""
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bash/powerline.sh
#fi
