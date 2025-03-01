# Aliases
alias man="wsl man" # If you don't have WSL or already on Unix-like OS, this alias is unnecessary.
alias code="vim" # Change to whatever Code Editor you want to use.
alias reload="source ~/.bashrc" # Execute this configuration file.
alias unload="rm ~/.bashrc" # Remove this configuration file (use with caution).
alias config="less ~/.bashrc" # View the contents of this configuration file.
alias config-e="nano ~/.bashrc" # Edit the contents of this configuration file.
alias config-bak="cp ~/.bashrc .bashrc" # Back up this configuration file (to current working directory).

# Variables
promptstring1=$PS1 # Primary Prompt String.
gitbranchcurrent=$(git branch --show-current 2>/dev/null) # The name of the current branch (requires Git-SCM).
gitprompt=$(__git_ps1 "(%s)") # The current branch name enclosed in parentheses (requires Git-SCM).
answer=''

# Functions
history_removal()
{
  if [ -f ~/.bash_history ]; then
    read -p "Bash History is found, do you want to remove it? (y/n): " answer
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
    if [[ "$answer" = "y" || "$answer" = "yes" ]]; then
      rm --force ~/.bash_history
      echo "Bash History has removed."
    else
      echo "Removal Operation skipped."
    fi
    echo "History Path (Empty means 'Not Found'): $(find ~/ -maxdepth 1 -name .bash_history)"
  fi
}

scm_alias()
{
  if [ -d .git ]; then
    read -p "Git repository is detected, do you want shorthand aliases? (y/n): " answer
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
    if [[ "$answer" = "y" || "$answer" = "yes" ]]; then
      alias init="git init"
      alias status="git status"
      alias log="git log --oneline"
      alias ga="git add"
      alias gc="git commit"
      alias gb="git branch"
      alias gs="git switch"
      alias gm="git merge"
      alias gp="git pull"
      # If gitignore file does not exist, create one.
      if [ ! -f .gitignore ]; then echo .gitignore > .gitignore; fi
    else
      echo "Aliases Operation skipped."
    fi
  fi
}

ps1_presets()
{
  read -p "Which 'PS1' preset do you want to use? (0 - 1, -plain/-alt): " answer
  answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
  case $answer in
    simplest) export PS1='\$ ';;
    0 | none | default | typical) export PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ ";;
    0-plain | none-plain | default-plain | typical-plain) export PS1="\u@\h:\w\$ ";;
    0-alt | none-alt | default-alt | typical-alt) export PS1="\[\e[01;32m\]\u@\h\[\e[0m\]:\[\e[01;34m\]\w\[\e[0m\]\$ ";;
    1 | preset1) export PS1='\[\e[38;5;220m\]\D{[%a %d-%m-%Y %H:%M:%S]}\[\e[0m\] \[\e[31m\]\u@\H\[\e[0m\]:\[\e[35m\]\w\[\e[0m\] \[\e[1m\]<\[\e[0;91;4m\]\#\[\e[92m\]\!\[\e[94m\]\j\[\e[0;1m\]>\[\e[0m\]\$ ';;
    1-plain | preset1-plain) export PS1='\D{[%a %d-%m-%Y %H:%M:%S]} \u@\H:\w <\#\!\j>\$ ';;
    1-plain2 | preset1-plain2) export PS1='\D{[%a %d-%m-%Y %H:%M:%S]} \u@\H:\w <\#'"'"'\!'"'"'\j>\$ ';;
    1-alt | preset1-alt) export PS1='\[\e[38;5;220m\]\D{[%a %d-%m-%Y %H:%M:%S]}\[\e[0m\] \[\e[31m\]\u\[\e[34m\]@\[\e[93m\]\H\[\e[0m\]:\[\e[35m\]\w\[\e[0m\] \[\e[1m\]<\[\e[0;91;4m\]\#\[\e[92m\]\!\[\e[94m\]\j\[\e[0;1m\]>\[\e[0m\]\$ ';;
    1-alt2 | preset1-alt2) export PS1='\[\e[38;5;220m\]\D{[%a %d-%m-%Y %H:%M:%S]}\[\e[0m\] \[\e[37m\]\u\[\e[90m\]@\[\e[36m\]\H\[\e[0m\]:\[\e[35m\]\w\[\e[0m\] \[\e[1m\]<\[\e[0;91;4m\]\#\[\e[92m\]\!\[\e[94m\]\j\[\e[0;1m\]>\[\e[0m\]\$ ';;
    *) echo "Invalid selection - exiting presets...";;
  esac
}

# Launch commands
history_removal
scm_alias
ps1_presets