check_defined = \
				$(strip $(foreach 1,$1, \
				$(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
				  $(if $(value $1),, \
				  $(error Undefined $1$(if $2, ($2))$(if $(value @), \
				  required by target `$@`)))
					
NAMESPACE := edbizarro

.PHONY: build
build: ## Build a Dockerfile (ex. DIR=telnet).
	@:$(call check_defined, DIR, directory of the Dockefile)
	docker build --rm --force-rm --compress --build-arg VCS_REF=`git rev-parse --short HEAD` --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t $(NAMESPACE)/$(subst /,:,$(patsubst %/,%,$(DIR))) ./$(DIR)
	
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'