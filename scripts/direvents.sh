direvents(){
    builtin cd "$@" && { [ ! -f .flavor ] || cat .flavor 1>&2; } && { [ ! -f .events ] || . .events; } && { presence; }
}
alias cd=direvents
