home:
	# todo experiment with --max-jobs=x
	guix home reconfigure --max-jobs=2 home.scm

docker/cli-plugins/docker-compose:
	curl -L https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 > '$@'
	chmod +x '$@'

authorize:
	guix archive --authorize < ../nonguix-signing-key.pub
