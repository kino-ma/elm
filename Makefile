OUTDIR := dist

default: build

build:
	docker-compose up

dev:
	docker-compose run -p 3001:3001 app yarn dev

test-server:
	python3 -m http.server --directory $(OUTDIR) 8080

clean:
	rm -rf $(OUTDIR)

.PHONY: default build clean dev test-server
