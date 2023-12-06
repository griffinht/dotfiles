.SECONDARY:

home: \
	binaries/themes \
	binaries/docker-compose \
	bin/ncspot \
	../../adw-colors \
	# todo experiment with --max-jobs=x
	guix home reconfigure --max-jobs=2 $(FLAGS) home.scm
home.offline: FLAGS=--no-substitutes
home.offline: home

authorize:
	guix archive --authorize < ../nonguix-signing-key.pub

include nvim.mk

binaries/docker-compose:
	curl -L https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 > '$@'
	chmod +x '$@'

#binaries:
#	mkdir -p '$@'

# bruh moment this really needs to be packaged properly
bin/ncspot:
	curl -L https://github.com/hrkfdn/ncspot/releases/download/v0.13.4/ncspot-v0.13.4-linux-x86_64.tar.gz | tar -xz -C '$<'
	touch '$@'

binaries/themes:
	mkdir -p '$@'
	curl -L https://github.com/lassekongo83/adw-gtk3/releases/download/v4.8/adw-gtk3v4-8.tar.xz | tar -xJ -C '$@'
	touch '$@'

../../../.local/share/intellij:
	mkdir -p '$@'
	curl -L https://download.jetbrains.com/idea/ideaIU-2023.2.3.tar.gz | tar -xz -C '$@' || (rmdir '$@'; exit 1)
	mv $@/*/* '$@'
	touch '$@'

../../adw-colors:
	git clone https://github.com/lassekongo83/adw-colors '$@'

# nerd font
#binaries/font:
#	curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/DejaVuSansMono.zip

clean:
	rm -rf ../../adw-colors
	rm -rf binaries/*
	rm -f bin/ncspot
