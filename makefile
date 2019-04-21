# Docker
docker_name := github-features
docker_tag := github-features

# Command
python3 := python3

.IGNORE: clean stop

main:
	@echo "[INFO] Nothing to run"

build: 
	@echo "test"

stop:
	@echo "[INFO] Stopping running container"
	@docker rm $(docker_tag)

run: stop
	@echo "[INFO] Run docker"
	@docker run $(docker_name)

sh-80: stop
	@echo "[INFO] Run docker with sh"
	@docker rm $(docker_tag)
	@docker run -it -p 80:8080 --name $(docker_tag) $(docker_name) sh

sh-dev: stop
	@echo "[INFO] Run docker with sh"
	@docker run -it -e NODE_ENV=development -p 8080:8080 --name $(docker_tag) $(docker_name) sh
