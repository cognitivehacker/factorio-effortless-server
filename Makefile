.PHONY: run
run:
	@./third-party/factorio/bin/x64/factorio --start-server maps/dafiti-world --server-settings configs/server-settings.json 

.PHONY: create
create:
	@./third-party/factorio/bin/x64/factorio --create maps/world-000

	
.PHONY: help
help:
	@./third-party/factorio/bin/x64/factorio --start-server 