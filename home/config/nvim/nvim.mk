# todo missing vim-ledger?
home: \
	binaries/jdtls \
	~/.local/share/lua-language-server \
	binaries/bash-language-server \
	binaries/vscode-langservers-extracted \
	binaries/vscode-bash-debug \
	binaries/scheme-lsp-server \
	config/nvim/pack/plugins/start/nvim-treesitter \
	binaries/rust-analyzer \
	config/nvim/pack/plugins/start/rust-tools \
	config/nvim/pack/plugins/start/plenary \
	config/nvim/pack/plugins/start/nvim-dap-ui \
	config/nvim/pack/Exafunction/start/codeium.vim \
	config/nvim/pack/plugins/start/gp.nvim \
	binaries/marksman

#	config/nvim/pack/themes/start/solarized8 \

#	config/nvim/pack/plugins/start/copilot.lua \
#
#	config/nvim/pack/plugins/start/nvim-dap-virtual-text \
#	../../luasnip \
#	../../nvim-cmp \
#	../../cmp-nvim-lsp \
#	../../friendly-snippets \
#	../../cmp_luasnip \
#	../../cmp-buffer \

config/nvim/pack/plugins/start/gp.nvim:
	git clone https://github.com/Robitx/gp.nvim '$@'

config/nvim/pack/Exafunction/start/codeium.vim:
	git clone https://github.com/Exafunction/codeium.vim '$@'

config/nvim/pack/plugins/start/copilot.lua:
	git clone https://github.com/zbirenbaum/copilot.lua '$@'

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

../../luasnip:
	git clone https://github.com/L3MON4D3/LuaSnip '$@'
../../friendly-snippets:
	git clone https://github.com/rafamadriz/friendly-snippets '$@'
../../cmp_luasnip:
	git clone https://github.com/saadparwaiz1/cmp_luasnip '$@'

../../nvim-cmp: 
	git clone https://github.com/hrsh7th/nvim-cmp '$@'

../../cmp-nvim-lsp:
	git clone https://github.com/hrsh7th/cmp-nvim-lsp '$@'

../../cmp-buffer:
	git clone https://github.com/hrsh7th/cmp-buffer '$@'


clean: nvim.clean
nvim.clean:
	rm -rf ../../auto-save.nvim
	rm -rf config/nvim/pack
