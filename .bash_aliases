# cd
alias ..='cd ..'
alias cdn='cd ~/node.js/'
alias cdr='cd ~/ror/'
alias cdh='cd ~'
alias cdd='cd ~/Desktop'

# git
alias g='git'
alias gi='git init && touch .gitignore && touch README.md'
alias ga='git add'
alias gaa='git add .'
alias gst='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gcma='git commit -am'
alias gbr='git branch'
alias gco='git checkout'
alias gdf='git diff'
alias gps='git push'
alias gpl='git pull'
alias gfe='git fetch'
alias gcl='git clone'
alias gra='git remote add'
alias grao='git remote add origin'
alias glg='git log --graph --pretty=format:"%Cred%h%Creset %C(yellow)%an%d%Creset %s %Cgreen(%cr)%Creset" --date=relative'
alias glo='git log --oneline'
alias gau='git log --pretty=format:"%an <%ae>"'

# rails
alias rrshowcommands="echo -e '${COLOR_LIGHT_PURPLE}Available commands: 
   ${COLOR_BLUE}rr${COLOR_NC}server
   ${COLOR_BLUE}rr${COLOR_NC}server${COLOR_BLUE}production
   ${COLOR_BLUE}rr${COLOR_NC}generate
   ${COLOR_BLUE}rr${COLOR_NC}console
   ${COLOR_BLUE}rr${COLOR_NC}migrate
   ${COLOR_BLUE}rr${COLOR_NC}generate${COLOR_BLUE}migration
   ${COLOR_BLUE}rr${COLOR_NC}migrate${COLOR_BLUE}down
   ${COLOR_BLUE}rr${COLOR_NC}migrate${COLOR_BLUE}up
'"

alias tlog='tail -f log/development.log'
alias rst='touch tmp/restart.txt'
alias rrmigrate='rake db:migrate'

rrmigratedown (){
  rake db:migrate:down VERSION=$@
}

rrmigrateup (){
  rake db:migrate:up VERSION=$@
}

rrgeneratemigration(){
  if [ -f ./script/generate ]; then
    ./script/generate migration $@ # Rails < 3
  else
    rails generate migration $@ # Rails 3
  fi
}

rrserver(){
  if [ -f ./script/server ]; then
    ./script/server $@ # Rails < 3
  else
    rails server $@ # Rails 3
  fi
}

rrserverproduction(){
  if [ -f ./script/server ]; then
    ./script/server -e production $@
  else
    rails server -e production $@
  fi
}

rrconsole(){
  if [ -f ./script/server ]; then
    ./script/console $@
  else
    rails console $@
  fi
}

rrgenerate(){
  if [ -f ./script/server ]; then
    ./script/generate $@
  else
    rails generate $@
  fi
}


# node
alias n='node'
alias nm='nodemon'
alias ni='npm install'
alias nig='npm install -g'
alias nv='npm view'
alias nf='npm find'
alias nu='npm uninstall'
alias nug='npm uninstall -g'

# ubuntu
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias mostusedcommands="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias untar='tar xvzf'
alias rebash='source ~/.bashrc'
alias tail='tail -f'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# apache2
alias a2restart='sudo /etc/init.d/apache2 restart'

