
# Show this help message
help:
	@echo "\033[1;34mAvailable targets:\033[0m"
	@awk 'BEGIN {FS = ":"; prev = ""} \
		/^# / {prev = substr($$0, 3); next} \
		/^[a-zA-Z_-]+:/ {printf "  \033[1;36m%-20s\033[0m %s\n", $$1, prev; prev = ""} \
		{prev = ""}' $(MAKEFILE_LIST)


# Build the docker image
init:
	docker compose build --pull
	$(MAKE) bundle-install

# Run bundle install inside a container
bundle-install:
	docker compose run dryer-lint bundle install

# Run rubocop inside a container
rubocop:
	docker compose run dryer-lint rubocop -c .rubocop.yml $(ARGS)

CMD ?= bash
# Run an arbitrary command inside a container
run:
	docker compose run dryer-lint $(CMD)

# Turn down service for the containers (docker compose down)
down:
	docker compose down --remove-orphans

# Turn down the containers and remove the volumes too!
clean:
	docker compose down --remove-orphans --volumes

# Run bundle install locally
local-bundle-install:
	bundle install

# Run bundle exec rubocop locally
local-rubocop:
	bundle exec rubocop -c .rubocop.yml $(ARGS)
