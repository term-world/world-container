direvents(){
    builtin cd "$@" && { [ ! -f .flavor ] || cat .flavor 1>&2; } && { [ ! -f .events ] || . .events; } && { report; }}
}
alias cd=direvents
