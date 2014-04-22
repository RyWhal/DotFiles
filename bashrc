# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#source .aliases file
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

#grep colors
export GREP_OPTIONS='--color=auto'

#history size
export HISTTIMEFORMAT='%Y-%b-%d::%Hh:%Mm:%Ss    '
export HISTCONTROL="ignorespace"
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend


#Functions
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

# Convert epoch to human readable
#taken from Dave Eddy http://github.com/bahamas10/dotfiles
epoch() {
        local num=${1//[^0-9]/}
        (( ${#num} < 13 )) && num=${num}000
        node -pe "new Date($num);"
}
