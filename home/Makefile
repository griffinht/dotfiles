.PHONY: home

home: bin
	guix home reconfigure home.scm

bin: bin/docker-compose

bin/docker-compose:
	curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o bin/docker-compose
	chmod +x bin/docker-compose
