.PHONY: home

home: bin/docker-compose bin/local/lf
	guix home reconfigure home.scm

bin:
	mkdir bin

bin/docker-compose: bin
	curl -L https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 > bin/docker-compose
	chmod +x bin/docker-compose
