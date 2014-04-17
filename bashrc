# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions

#propmpt
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l'
alias vi='vim'
alias d='du -ch --max-depth=1'
alias sd='sudo du -ch --max-depth=1'
alias mgmt='ssh management200'
alias pullgit='git fetch origin && git rebase origin/master'
alias mysql_sockets='egrep ^\s*socket /etc/my.cnf | awk '"'"'{print $3}'"'"
alias mysql_ports='egrep ^\s*port /etc/my.cnf | awk '"'"'{print $3}'"'"
alias memused='ps aux | sort -nk +4 | tail'
alias connbyhost='netstat -a | awk '"'"'{print $5}'"'"' | awk -F. '"'"'{print $1}'"'"' | sort -d | uniq -c | sort -n'
alias connbyip='netstat -an | awk '"'"'{print $5}'"'"' | awk -F. '"'"'{print $1}'"'"' | sort -d | uniq -c | sort -n'
alias slave='echo "show slave status \G" | mysql -h'

# Puppet linting
alias plint='puppet-lint --with-context --no-80chars-check'
alias plintcommit='for file in $(git status | grep -e '"'"'modules.*pp$'"'"' | awk '"'"'{print $NF}'"'"'); do echo "$file"; plint "$file"; done'

#some mysql aliases
alias mycon='mysql -u ryan -p -h'
alias slave='echo "show slave status \G" | mysql -u ryan -p -h'
alias plist='echo "show processlist " | mysql -u ryan -p -h'
alias pflist='echo "show full processlist" | mysql -u ryan -p -h'

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Decode JSON on the fly. Usage: $ json_decode someJsonFilledFile
alias json_decode='python -c'\''from simplejson.tool import main; main()'\'''
#grep colors
export GREP_OPTIONS='--color=auto'

#history size
export HISTTIMEFORMAT='%Y-%b-%d::%Hh:%Mm:%Ss    '
export HISTCONTROL="ignorespace"
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend

mylag() {
        for i in $(egrep '^\s*socket' /etc/my.cnf | awk '{print $3}')
        do
                mysql -S "${i}" -e 'show slave status\G' | grep Seconds_Behind
        done
}

# Quick an dirty FTP upload tool to a folder on box!
clishare() {
        if [[ -z "$1" ]];
        then
                echo "Usage: clishare filename"
        else
                curl --ftp-create-dirs -T "$1" "ftp://ftp.box.com//clishare/${1}" --user ryan@whalennow.com
        fi
}


