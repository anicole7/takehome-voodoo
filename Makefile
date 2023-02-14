.PHONY: build_and_run build run test

build_and_run: build run

build:
	bundle install
	bin/rails db:migrate db:seed

run:
	bin/rails server

test:
	bin/rails test