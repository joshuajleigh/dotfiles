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
PATH="$PATH:.rbenv/bin"
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

#open opsdocs in lynx
alias OPSDOCS="lynx https://gh.leapfrogonline.com/pages/ops/"
