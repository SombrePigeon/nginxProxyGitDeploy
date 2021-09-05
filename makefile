ifeq ($(WEBSITES_ENV), prod)
 $(info prod $(WEBSITES_ENV) detected)
 COMPOSE_FILE=docker-compose.yml
else ifeq ($(WEBSITES_ENV), dev)
 $(info prod $(WEBSITES_ENV) detected)
 COMPOSE_FILE=docker-compose-dev.yml
else
 $(error : WEBSITES_ENV is not defined to "dev" or "prod";)
endif


init:
	git submodule update --init
	cd .git/hooks/ && ln -s -f ../../post-receive post-receive
	git config receive.denyCurrentBranch updateInstead #ignore
	touch init #unique initialisation

nginx-proxy-up: $(COMPOSE_FILE) dockerfile
	$(MAKE) nginx-proxy-down
	$(ENV) docker-compose -f $(COMPOSE_FILE) up  -d --build
	touch nginx-proxy-up

nginx-proxy-down: down
	rm -f nginx-proxy-up
	docker-compose -f $(COMPOSE_FILE) down
	

update: init nginx-proxy
	git --git-dir=.git submodule update --init
	git --git-dir=.git submodule foreach $(MAKE) update

down:
	git --git-dir=.git submodule foreach $(MAKE) down

restart: down up

.PHONY:restart down