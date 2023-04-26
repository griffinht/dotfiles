.PHONY: home

home: bin
	guix home reconfigure home.scm

bin: bin/docker-compose bin/local/lf

bin/docker-compose:
	curl -L https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 > bin/docker-compose
	chmod +x bin/docker-compose

bin/local/lf:
	curl -L https://github.com/horriblename/lf/releases/download/r28-1/lf-linux-amd64.tar.gz | tar -xz -C bin/local
