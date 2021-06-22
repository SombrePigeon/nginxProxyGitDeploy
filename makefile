init:
	git submodule update --init
	cd .git/hooks/ && ln -s -f ../../post-receive post-receive
	git config receive.denyCurrentBranch updateInstead #ignore
	touch init #unique initialisation

nginx-proxy-up: docker-compose.yml
	$(MAKE) nginx-proxy-down
	docker-compose up -d --build
	touch nginx-proxy-up

nginx-proxy-down: down
	rm -f nginx-proxy-up
	docker-compose down
	

update: init nginx-proxy-up
	git --git-dir=.git submodule update --init
	git --git-dir=.git submodule foreach $(MAKE) update

down:
	git --git-dir=.git submodule foreach $(MAKE) down

restart: down up

.PHONY:restart down