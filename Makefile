###############################################################
# RUBY DEVELOPMENT CONTAINER
###############################################################

ruby_dev_up:
	docker compose up -d ruby_dev

ruby_dev_down:
	docker compose down ruby_dev

ruby_dev_shell:
	docker compose exec ruby_dev bash

ruby_dev_build:
	docker compose build ruby_dev

ruby_dev_rebuild:
	docker compose build ruby_dev --no-cache

###############################################################
# DEPLOY SERVER CONTAINER
###############################################################

server_build:
	docker compose build deploy_server

server_rebuild:
	docker compose build deploy_server --no-cache

server_up:
	docker compose up -d deploy_server

server_down:
	docker compose down deploy_server

server_shell:
	docker compose exec deploy_server bash

server_ssh_config:
	docker compose exec deploy_server cat /etc/ssh/sshd_config

server_ssh_password_checks:
	docker compose exec deploy_server cat /etc/ssh/sshd_config | grep PermitRootLogin
	docker compose exec deploy_server cat /etc/ssh/sshd_config | grep PasswordAuthentication
	docker compose exec deploy_server cat /etc/ssh/sshd_config | grep PubkeyAuthentication
	docker compose exec deploy_server cat /etc/ssh/sshd_config | grep PermitEmptyPasswords

# `-o StrictHostKeyChecking=no` to skip the prompt to add the server to the list of known hosts
ssh_connect:
	ssh -o StrictHostKeyChecking=no root@localhost -p 2222

# Possible to connect to the server using the IP address
# Could be useful on Linux or WSL. Does not work on MacOS/Docker Desktop
ssh_ip_connect:
	ssh root@172.30.0.10 -p 2222
