.DEFAULT_GOAL := prepare

.PHONY: prepare
prepare: clean
	@./scripts/prepare.sh

.PHONY: clean
clean:
	@./scripts/clean.sh


.PHONY: install
install:
	@./scripts/install.sh

.PHONY: run
run:
	@./tmp/usr/local/lib/factorio/bin/x64/factorio --start-server maps/world --server-settings configs/server-settings.json 

.PHONY: create
create:
	@/usr/local/bin/factorio --create /home/factorio/maps/world

.PHONY: help
help:
	@./third-party/factorio/bin/x64/factorio --start-server 

