#
# ENVIRONMENT
#

# todo be more careful here and don't override things?

# make ssh work on guix foreign distro
# not needed for guix distro????
# but arch needs this and probably debian
# when nss-certs is installed
set -x SSL_CERT_DIR "$HOME/.guix-home/profile/etc/ssl/certs"
set -x SSL_CERT_FILE "$HOME/.guix-home/profile/etc/ssl/certs/ca-certificates.crt"
set -x GIT_SSL_CAINFO "$SSL_CERT_FILE"
set -x GUIX_LOCPATH "$HOME/.guix-home/profile/lib/locale"

if ! set -q FISHY
    echo fishy
    set -x FISHY
    # add local bin for testing
    set -x PATH "$HOME/.local/bin:$PATH"
    # add missing guix-profile bin
    # this is only because of scheme-lsp-server
    # https://codeberg.org/rgherdt/scheme-lsp-server#installation-with-guix
    # i wish i could install this to guix-home instead and have everything just work
    set -x PATH "$HOME/.guix-profile/bin:$PATH"
    set -x GUILE_LOAD_PATH "$HOME/.guix-profile/share/guile/site/3.0:$GUILE_LOAD_PATH"
    set -x GUILE_LOAD_COMPILED_PATH "$HOME/.guix-profile/lib/guile/3.0/site-ccache:$GUILE_LOAD_COMPILED_PATH"
end

# use bat as pager
# this is useless and the same as PAGER=less
#set -x PAGER "bat --style=plain"

# use bat as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
# https://github.com/sharkdp/bat/issues/2593
set -x MANROFFOPT '-c' 

# set editor
set -x EDITOR "nvim"

# 
# PIP
#

# pip install path
set -x PIP_TARGET "$HOME/.local/share/pip"
# pip install will put binaries here
if ! set -q FISHY
    # todo path priority?
    set -x PATH "$PATH:$HOME/.local/share/pip/bin"
    # this makes python script import work
    set -x PYTHONPATH "$PYTHONPATH:$HOME/.local/share/pip"
end
