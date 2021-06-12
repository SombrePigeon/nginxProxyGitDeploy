init: nginx-proxy-up
	git submodule update --init
	ln -s post-receive .git/hooks/post-receive
	git config receive.denyCurrentBranch updateInstead #ignore
	touch init #unique initialisation

nginx-proxy-up: 
	docker-compose up -d --build
	touch nginx-proxy-up

nginx-proxy-down: down
	docker-compose down
	rm nginx-proxy-up

update: init
	git submodule foreach make update

down:
	git submodule foreach make down

restart: down up
