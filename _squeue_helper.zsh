#!/bin/bash
# helper autocompletion for slurm
# license MIT


q () {
    template="%8i %9P %9q %30j %8T %18S %.12l %.12L %.4D %Z"
    squeue -S -T,u,i -o "$template" -u $USER | \
        sed -r 's/([0-9])T([0-9]*:[0-9]*):[0-9]*\ /\1\ \2\ \ \ /;s/^(.*)PENDING(.*)$/\x1b[2m\1PENDING\2\x1b[0m/'
}

# jcd:
# Move to a job working directory from its jobID
jcd () {
    local job_working_directory=$(rsqueue -d ${1%%-*})

    local jobid_d=${1%%-*}
    if [ -z $jobid_d ]
    then
        jobid_d=$(squeue -S -T,u,i -h -u $USER -o "%i" | head -n 1)
        [ -z $jobid_d ] && echo "No jobID" >&2 && exit 1
    fi
    job_working_directory=$(squeue -u $USER -o "%i %Z" | grep -m 1 "^${jobid_d%%-*}\ "| sed 's/^[^\ ]*\ //')

    if [ -d "$job_working_directory" ]
    then
        echo "Moving to $job_working_directory"
        cd "$job_working_directory"
    fi
}

function _jcd(){
    _describe 'jcd' "($(squeue -u $USER -h -o "%i:%j\ %Z"))"   
}

compdef _jcd jcd 


# qcd:
# Wrapper of cd to move to a job working directory, autocompletion of only job directories
qcd () {
    if [ -d "${@: -1}" ]
    then
        echo "Moving to ${@: -1}"
        cd "${@: -1}"
    fi
}

_qcd() {
    _describe 'jcd' "($(squeue -u $USER -h -o "%Z:%i\ '%j'"))"   
}

compdef _qcd qcd


compdef _jcd scancel


# Unload function definitions and autocompletion bindings
if [ "$1" = "unload" ]
then
    unset -f jcd
    unset -f _jcd
    unset -f qcd
    unset -f _qcd

    compdef _files jcd
    compdef _files qcd
fi

