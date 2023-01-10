# make ssh work on guix foreign distro
# not needed for guix distro????
# but arch needs this and probably debian
# when nss-certs is installed
export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
export GIT_SSL_CAINFO="$SSL_CERT_FILE"

footssh() {
	TERM=linux ssh $@
}
alias ssh=footssh

# set window title to working directory
PROMPT_COMMAND='echo -en "\033]0;$(pwd)\a"'
