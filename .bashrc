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

export EDITOR=vim                           #sets vim as default
export BROWSER=firefox                      #sets firefox as default
export VAGRANT_DEFAULT_PROVIDER=virtualbox  #helps vagrant work
export GITHUB_URL=https://gh.leapfrogonline.net/ #for ruby gist gem with enterprise github
export PATH="$HOME/bin:$PATH"               #adds local scripts
#for hub commands
eval "$(hub alias -s)"
export PATH="$HOME/.rbenv/bin:$PATH"        #allows rbenv to work
set bell-style visible

#pyenv stuff
export PATH="/home/jleigh/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#for techdocs cache
if [ ! -d ~/.technology-docs-cache ]
  then git clone https://gh.leapfrogonline.net/documentation/technology-docs ~/.technology-docs-cache
else
  find ~ -maxdepth 1 -type d -ctime 1 -name .technology-docs-cache -exec timeout 5 git -C {} pull origin master ';'
fi

#makes color output default for ls
alias ls='ls --color=always'

#open vim with nerdtree
alias vimd="vim -c NERDTree"

#open calcurse with orgmode
alias CAL="VISUAL='vim -c \"setl filetype=org\"' PAGER=vim calcurse -D ~/Repos/ex2calcurse/.calcurse"

#include -r for less
alias less="less -r"

#open lynx using home config
alias lynx="lynx -cfg=~/.config/lynx/lynx.cfg"

#open opsdocs in lynx
alias OPSDOCS="https://gh.leapfrogonline.net/pages/documentation/technology-docs/"

#see ip and location
alias whereami="curl ifconfig.co/json 2>/dev/null | jq -r '\"\(.ip):\n\(.country):\n\(.city):\n\(.hostname)\"' | column -t -s:"

#work email
alias ex2mutt="docker run --rm \
    --name='ex2mutt' \
    --env='DISPLAY' \
    -e USERID=$(id -u) \
    -e FULLNAME='joshua leigh' \
    -e ADUSER='jleigh@leapfrogonline.com' \
    -e ADPASSWORD=`cat ~/.config/.53cr375 | awk -F "=" '{gsub(/"/, ""); if($1=="password"){print $2}}'` \
    -v /etc/localtime:/etc/localtime \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v ~/Maildir:/home/user/Maildir \
    -it exchange2mutt"

complete -C /home/jleigh/bin/vault vault

export NVM_DIR="/home/jleigh/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
