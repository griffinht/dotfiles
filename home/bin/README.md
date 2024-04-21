
intellij

```sh
#!/usr/bin/env sh

#https://libreddit.hot.griffinht.com/r/GUIX/comments/11tljcb/running_eclipse_ide_in_gnu_guix_system/

#procps needed for ps command

guix shell \
    --container \
    --emulate-fhs \
    --network \
    --preserve='^DBUS_' --expose=/var/run/dbus \
    --preserve='^DISPLAY$' \
    --expose=/sys/dev --expose=/sys/devices --expose=/dev/dri \
    --share="$HOME" \
    git grep e2fsprogs procps \
    which coreutils glib gtk+ glibc libxtst adwaita-icon-theme openjdk@17:jdk \
    -- "$@"
```
