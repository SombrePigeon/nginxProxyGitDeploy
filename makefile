
init: nginx-proxy
	git submodule update --init
	git submodule foreach make init
	ln -s post-receive .git/hooks/post-receive
	git config receive.denyCurrentBranch updateInstead #ignore
	touch init #unique initialisation

nginx-proxy-up: 
	docker-compose up -d --build
	touch nginx-proxy-up
nginx-proxy-down: 
	docker-compose up -d --build
	rm nginx-proxy-up

update:
	git submodule foreach make update

down:
	git submodule foreach make down

restart: down up




all:
	cd myWebsite && docker-compose down && docker-compose up -d 
