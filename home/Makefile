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
	# todo $ interpolation doesn't work here... this is a makefile
	exit 1
	mkdir -p '$@'
	temp="$(mktemp)" \
		&& curl -L 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/DejaVuSansMono.zip' > "$temp" \
		&& unzip -d "$@" "$temp" \
		&& rm "$temp"

hledger:
	# todo hledger gives us a zip which is a tarball...
	temp="$$(mktemp -d)" \
	     && curl -L 'https://github.com/simonmichael/hledger/releases/download/1.33/hledger-linux-x64.zip' > "$$temp/hledger.zip" \
	     && unzip -d "$$temp" "$$temp/hledger.zip" \
	     && tar -x -C binaries/bin -f "$$temp/hledger-linux-x64.tar" \
	     && rm -r "$$temp"

clean:
	rm -rf ../../adw-colors
	#rm -rf binaries/*
