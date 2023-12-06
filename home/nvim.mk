# todo missing vim-ledger?
home: \
	binaries/jdtls \
	../../auto-save.nvim \
	../../nvim-lspconfig \
	../../nvim-jdtls \
	~/.local/share/lua-language-server \
	config/nvim/pack/plugins/start/nvim-dap \
	binaries/bash-language-server \
	binaries/vscode-langservers-extracted \
	binaries/vscode-bash-debug \
	binaries/scheme-lsp-server \
	config/nvim/pack/plugins/start/nvim-treesitter \
	binaries/rust-analyzer \
	config/nvim/pack/plugins/start/rust-tools \
	config/nvim/pack/plugins/start/plenary \
	config/nvim/pack/plugins/start/nvim-dap-ui \
	binaries/marksman
#
#	config/nvim/pack/plugins/start/nvim-dap-virtual-text \
#	../../luasnip \
#	../../nvim-cmp \
#	../../cmp-nvim-lsp \
#	../../friendly-snippets \
#	../../cmp_luasnip \
#	../../cmp-buffer \

config/nvim/pack/plugins/start/nvim-dap-ui:
	git clone https://github.com/rcarriga/nvim-dap-ui '$@'

config/nvim/pack/plugins/start/plenary:
	git clone https://github.com/nvim-lua/plenary.nvim '$@'

config/nvim/pack/plugins/start/rust-tools:
	git clone https://github.com/simrat39/rust-tools.nvim '$@'

#https://github.com/theHamsta/nvim-dap-virtual-text/issues/18
#requires nvim treesitter!
config/nvim/pack/plugins/start/nvim-dap-virtual-text:
	git clone https://github.com/theHamsta/nvim-dap-virtual-text '$@'

config/nvim/pack/plugins/start/nvim-treesitter:
	git clone https://github.com/nvim-treesitter/nvim-treesitter '$@'

binaries/rust-analyzer:
	curl -L https://github.com/rust-lang/rust-analyzer/releases/download/2023-12-04/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip > '$@'
	chmod +x '$@'

binaries/vscode-java-test:
	git clone https://github.com/microsoft/vscode-java-test '$@'
	cd '$@' && guix shell node -- sh -c 'npm install && npm run build-plugin'

binaries/java-debug:
	git clone https://github.com/microsoft/java-debug '$@'
	cd '$@' && ./mvnw clean install

binaries/scheme-lsp-server:
	git clone https://codeberg.org/rgherdt/scheme-lsp-server '$@'
	cd '$@' && guix package -f guix.scm

config/nvim/pack/plugins/start/nvim-dap:
	git clone https://github.com/mfussenegger/nvim-dap.git '$@'

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

../../auto-save.nvim:
	git clone https://github.com/Pocco81/auto-save.nvim '$@'

../../luasnip:
	git clone https://github.com/L3MON4D3/LuaSnip '$@'
../../friendly-snippets:
	git clone https://github.com/rafamadriz/friendly-snippets '$@'
../../cmp_luasnip:
	git clone https://github.com/saadparwaiz1/cmp_luasnip '$@'

../../nvim-cmp: 
	git clone https://github.com/hrsh7th/nvim-cmp '$@'

../../nvim-lspconfig:
	git clone https://github.com/neovim/nvim-lspconfig '$@'

../../cmp-nvim-lsp:
	git clone https://github.com/hrsh7th/cmp-nvim-lsp '$@'

../../cmp-buffer:
	git clone https://github.com/hrsh7th/cmp-buffer '$@'

../../nvim-jdtls:
	git clone https://github.com/mfussenegger/nvim-jdtls '$@'


# todo https://github.com/mfussenegger/nvim-dap
../../nvim-dap:
	git clone https://github.com/mfussenegger/nvim-dap.git '$@'
	#todo touch necessary here?
	#touch '$@'
	#~/.config/nvim/pack/plugins/start/nvim-dap

clean: nvim.clean
nvim.clean:
	rm -rf ../../auto-save.nvim
	rm -rf config/nvim/pack
