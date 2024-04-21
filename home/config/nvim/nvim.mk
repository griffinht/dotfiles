# todo missing vim-ledger?
home: \
	dumb \
	~/.local/share/lua-language-server \
	binaries/jdtls



#	config/nvim/pack/plugins/start/copilot.lua \

# codium.vim
# gp.nvim
# copilot.lua


binaries/jdtls:
	mkdir -p '$@'
	# i wish this was a milestone but the snapshot should be fine lol
	curl -L https://www.eclipse.org/downloads/download.php?file=/jdtls/snapshots/jdt-language-server-1.29.0-202310261436.tar.gz | tar -xz -C '$@'
	touch '$@'

~/.local/share/lua-language-server:
	mkdir -p '$@'
	curl -L 'https://github.com/LuaLS/lua-language-server/releases/download/3.7.0/lua-language-server-3.7.0-linux-x64.tar.gz' | tar -xz -C '$@'
	touch '$@'



binaries/scheme-lsp-server:
	git clone https://codeberg.org/rgherdt/scheme-lsp-server '$@'
	cd '$@' && guix package -f guix.scm




dumb: \
	binaries/java-debug \
	binaries/vscode-java-test \
	binaries/bash-language-server \
	binaries/vscode-langservers-extracted \
	binaries/typescript-language-server \
	binaries/scheme-lsp-server

binaries/java-debug:
	git clone https://github.com/microsoft/java-debug '$@'
	cd '$@' && ./mvnw clean install

binaries/vscode-java-test:
	git clone https://github.com/microsoft/vscode-java-test '$@'
	cd '$@' && guix shell node -- sh -c 'npm install && npm run build-plugin'

binaries/bash-language-server:
	guix shell node -- npm install -g --prefix='$@' bash-language-server

binaries/vscode-langservers-extracted:
	guix shell node -- npm install -g --prefix='$@' vscode-langservers-extracted

binaries/typescript-language-server:
	guix shell node -- npm install -g --prefix='$@' typescript-language-server typescript
