.SECONDARY=

home: \
	binaries/themes \
	binaries/docker-compose \
	bin/ncspot \
	binaries/jdtls \
	../../adw-colors \
	../../auto-save.nvim
	# todo experiment with --max-jobs=x
	guix home reconfigure --max-jobs=2 home.scm

authorize:
	guix archive --authorize < ../nonguix-signing-key.pub

binaries/docker-compose: binaries
	curl -L https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 > '$@'
	chmod +x '$@'

#binaries:
#	mkdir -p '$@'

# bruh moment this really needs to be packaged properly
bin/ncspot: bin
	curl -L https://github.com/hrkfdn/ncspot/releases/download/v0.13.4/ncspot-v0.13.4-linux-x86_64.tar.gz | tar -xz -C '$<'
	touch '$@'

binaries/jdtls: bin
	mkdir -p '$@'
	curl -L https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz | tar -xz -C '$@'

binaries/themes: binaries
	mkdir -p '$@'
	curl -L https://github.com/lassekongo83/adw-gtk3/releases/download/v4.8/adw-gtk3v4-8.tar.xz | tar -xJ -C '$@'
	touch '$@'

../../adw-colors:
	git clone https://github.com/lassekongo83/adw-colors '$@'

../../auto-save.nvim:
	git clone https://github.com/Pocco81/auto-save.nvim '$@'

clean:
	rm -rf ../../adw-colors
	rm -rf ../../auto-save.nvim
	rm -rf binaries/*
	rm -f bin/ncspot
