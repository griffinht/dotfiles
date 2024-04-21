.SECONDARY:

home: \
	binaries/themes \
	../../adw-colors \
	binaries/fonts/dejavu \
	# todo experiment with --max-jobs=x
	guix home reconfigure --max-jobs=3 $(FLAGS) home.scm
home.offline: FLAGS=--no-substitutes
home.offline: home
authorize:
	guix archive --authorize < ../nonguix-signing-key.pub

include config/nvim/nvim.mk

binaries/themes:
	mkdir -p '$@'
	curl -L https://github.com/lassekongo83/adw-gtk3/releases/download/v4.8/adw-gtk3v4-8.tar.xz | tar -xJ -C '$@'
	touch '$@'

../../adw-colors:
	git clone https://github.com/lassekongo83/adw-colors '$@'

# todo
pip:
	pip install openinterpretertodo_double check if this is the right package name

# nerd font
binaries/fonts/dejavu:
	mkdir -p '$@'
	temp="$(mktemp)" \
		&& curl -L 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/DejaVuSansMono.zip' > "$temp" \
		&& unzip -d "$@" "$temp" \
		&& rm "$temp"

clean:
	rm -rf ../../adw-colors
	#rm -rf binaries/*
