function docker-swarm {
	export DOCKER_HOST=tcp://10.10.10.240:2376
	export DOCKER_CERT_PATH=~/.docker
	export DOCKER_TLS_VERIFY=1
}
