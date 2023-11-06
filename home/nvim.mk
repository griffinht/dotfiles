home: \
	binaries/jdtls \
	../../auto-save.nvim \
	../../luasnip \
	../../nvim-cmp \
	../../nvim-lspconfig \
	../../cmp-nvim-lsp \
	../../friendly-snippets \
	../../cmp_luasnip \
	../../cmp-buffer \
	../../nvim-jdtls \
	~/.local/share/lua-language-server \
	binaries/marksman

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
