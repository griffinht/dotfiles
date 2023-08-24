#!/bin/sh

#https://libreddit.hot.griffinht.com/r/GUIX/comments/11tljcb/running_eclipse_ide_in_gnu_guix_system/
#https://libreddit.hot.griffinht.com/r/GUIX/comments/desnjc/dirty_install_for_precompiled_binaries/
#todo

guix shell \
    --container \
    --emulate-fhs \
    --network \
    --preserve='^DBUS_' --expose=/var/run/dbus \
    --preserve='^DISPLAY$' \
    --preserve='^PATH' \
    --expose=/sys/dev --expose=/sys/devices --expose=/dev/dri \
    --share=$HOME \
    --expose=$(readlink $HOME/.local/bin) \
    grep which pulseaudio openssl@1.1.1q libxcb coreutils glib gtk+ glibc gcc-toolchain gcc-toolchain:static \
    -- 
    #--expose=/gnu \
