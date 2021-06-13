init: nginx-proxy-up
	git submodule update --init
	cd .git/hooks/ && ln -s -f ../../post-receive post-receive
	git config receive.denyCurrentBranch updateInstead #ignore
	touch init #unique initialisation

nginx-proxy-up: 
	docker-compose up -d --build
	touch nginx-proxy-up

nginx-proxy-down: down
	docker-compose down
	rm nginx-proxy-up

update: init
	git --git-dir=.git submodule foreach make update

down:
	git --git-dir=.git submodule foreach make down

restart: down up
