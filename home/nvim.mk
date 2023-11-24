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
	binaries/marksman
#
#	config/nvim/pack/plugins/start/nvim-dap-virtual-text \
#	../../luasnip \
#	../../nvim-cmp \
#	../../cmp-nvim-lsp \
#	../../friendly-snippets \
#	../../cmp_luasnip \
#	../../cmp-buffer \

#https://github.com/theHamsta/nvim-dap-virtual-text/issues/18
#requires nvim treesitter!
config/nvim/pack/plugins/start/nvim-dap-virtual-text:
	git clone https://github.com/theHamsta/nvim-dap-virtual-text '$@'

config/nvim/pack/plugins/start/nvim-treesitter:
	git clone https://github.com/nvim-treesitter/nvim-treesitter '$@'

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
	curl -L https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz | tar -xz -C '$@'
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
