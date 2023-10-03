home: \
	binaries/jdtls \
	../../auto-save.nvim \
	../../luasnip \
	../../nvim-cmp

binaries/jdtls: bin
	mkdir -p '$@'
	curl -L https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz | tar -xz -C '$@'
	touch '$@'

../../auto-save.nvim:
	git clone https://github.com/Pocco81/auto-save.nvim '$@'

../../luasnip:
	git clone https://github.com/L3MON4D3/LuaSnip '$@'

../../nvim-cmp: 
	git clone https://github.com/hrsh7th/nvim-cmp '$@'

# todo https://github.com/mfussenegger/nvim-dap
../../nvim-dap:
	git clone https://github.com/mfussenegger/nvim-dap.git '$@'
	#todo touch necessary here?
	#touch '$@'
	#~/.config/nvim/pack/plugins/start/nvim-dap

clean: nvim.clean
nvim.clean:
	rm -rf ../../auto-save.nvim
