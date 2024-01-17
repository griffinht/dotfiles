# todo missing vim-ledger?
home: \
	binaries/jdtls \
	~/.local/share/lua-language-server \
	binaries/bash-language-server \
	binaries/vscode-langservers-extracted \
	binaries/vscode-bash-debug \
	binaries/scheme-lsp-server \
	config/nvim/pack/Exafunction/start/codeium.vim \
	config/nvim/pack/plugins/start/gp.nvim \
	binaries/marksman


#	config/nvim/pack/plugins/start/copilot.lua \

config/nvim/pack/plugins/start/gp.nvim:
	git clone https://github.com/Robitx/gp.nvim '$@'

config/nvim/pack/Exafunction/start/codeium.vim:
	git clone https://github.com/Exafunction/codeium.vim '$@'

config/nvim/pack/plugins/start/copilot.lua:
	git clone https://github.com/zbirenbaum/copilot.lua '$@'

binaries/vscode-java-test:
	git clone https://github.com/microsoft/vscode-java-test '$@'
	cd '$@' && guix shell node -- sh -c 'npm install && npm run build-plugin'

binaries/java-debug:
	git clone https://github.com/microsoft/java-debug '$@'
	cd '$@' && ./mvnw clean install

binaries/scheme-lsp-server:
	git clone https://codeberg.org/rgherdt/scheme-lsp-server '$@'
	cd '$@' && guix package -f guix.scm

binaries/vscode-bash-debug:
	git clone https://github.com/rogalmic/vscode-bash-debug '$@'

binaries/bash-language-server:
	mkdir -p '$@'
	cd '$@' && guix shell node -- npm install bash-language-server

binaries/vscode-langservers-extracted:
	mkdir -p '$@'
	cd '$@' && guix shell node -- npm install vscode-langservers-extracted

binaries/jdtls:
	mkdir -p '$@'
	# i wish this was a milestone but the snapshot should be fine lol
	curl -L https://www.eclipse.org/downloads/download.php?file=/jdtls/snapshots/jdt-language-server-1.29.0-202310261436.tar.gz | tar -xz -C '$@'
	touch '$@'

binaries/marksman:
	curl -L https://github.com/artempyanykh/marksman/releases/download/2023-10-30/marksman-linux-x64 > '$@'
	chmod +x '$@'

~/.local/share/lua-language-server:
	mkdir -p '$@'
	curl -L 'https://github.com/LuaLS/lua-language-server/releases/download/3.7.0/lua-language-server-3.7.0-linux-x64.tar.gz' | tar -xz -C '$@'
	touch '$@'
