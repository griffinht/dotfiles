# make ssh work on guix foreign distro
# not needed for guix distro????
# but arch needs this
export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
export GIT_SSL_CAINFO="$SSL_CERT_FILE"

footssh() {
	TERM=linux ssh $@
}
alias ssh=footssh
