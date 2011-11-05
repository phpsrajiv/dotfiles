# cd
alias ..='cd ..'
alias cdh='cd ~'
alias cdd='cd ~/Desktop'

# git
alias glg='git log --graph --pretty=format:"%Cred%h%Creset %C(yellow)%an%d%Creset %s %Cgreen(%cr)%Creset" --date=relative'
alias gist='~/local/bin/gist.sh'
alias deployc='git push && cap deploy'
alias deployh='git push && git push heroku master'

# svn
alias svndiff='svn diff | less -r'

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
   ${COLOR_BLUE}rr${COLOR_NC}log
   ${COLOR_BLUE}rr${COLOR_NC}restart
'"

alias rrlog='tail -f log/development.log'
alias rrrestart='touch tmp/restart.txt'
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
alias update='echo "madhu" | sudo -S apt-get update'
alias mostusedcommands="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias untar='tar xvzf'
alias rebash='source ~/.bashrc'
alias tail='tail -f'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='gedit'

# apache2
alias a2restart='echo "madhu" | sudo -S /etc/init.d/apache2 restart'
