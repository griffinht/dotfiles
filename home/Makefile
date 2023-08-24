home: \
	binaries/themes \
	binaries/docker-compose \
	../../adw-colors \
	../../auto-save.nvim
	# todo experiment with --max-jobs=x
	guix home reconfigure --max-jobs=2 home.scm

authorize:
	guix archive --authorize < ../nonguix-signing-key.pub

binaries/docker-compose:
	curl -L https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 > '$@'
	chmod +x '$@'

binaries/themes:
	mkdir -p '$@'
	curl -L https://github.com/lassekongo83/adw-gtk3/releases/download/v4.8/adw-gtk3v4-8.tar.xz | tar -xJ -C '$@'

../../adw-colors:
	git clone https://github.com/lassekongo83/adw-colors '$@'

../../auto-save.nvim:
	git clone https://github.com/Pocco81/auto-save.nvim '$@'

clean:
	rm -rf ../../adw-colors
	rm -rf ../../auto-save.nvim
	rm -f docker/cli-plugins/docker-compose
