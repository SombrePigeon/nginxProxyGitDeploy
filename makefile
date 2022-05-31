ifeq ($(WEBSITES_ENV), prod)
 $(info $(WEBSITES_ENV) environment detected)
 COMPOSE_FILE=docker-compose.yml
else ifeq ($(WEBSITES_ENV), dev)
 $(info $(WEBSITES_ENV) environment detected)
 COMPOSE_FILE=docker-compose-dev.yml
else
 $(error : WEBSITES_ENV is not defined to "dev" or "prod";)
endif

update: update-check
	$(MAKE) .update

init: 
	$(MAKE) .init

.update: $(COMPOSE_FILE) Dockerfile update-check init
	$(MAKE) down
	$(ENV) docker-compose -f $(COMPOSE_FILE) up  -d --build
	touch .update

down: services-down
	rm -f update
	docker-compose -f $(COMPOSE_FILE) down
	
services-update: update
	git --git-dir=.git submodule update --init
	git --git-dir=.git submodule foreach $(MAKE) update

services-down:
	git --git-dir=.git submodule foreach $(MAKE) down

.init:
	git submodule update --init
	cd .git/hooks/ && ln -s -f ../../post-receive post-receive
	git config receive.denyCurrentBranch updateInstead #ignore
	touch .init #unique initialisation


update-check:
	docker-compose ps -q | grep -q "" || rm -f update


.PHONY:restart services-down update-check update init