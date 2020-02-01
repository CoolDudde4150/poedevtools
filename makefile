.PHONY: help
help:
	@printf "\n%s" "Usage:" \
			"make test_offline:		Uses pytest on all test files with the name formatted 'offline*test*.py'"\
			"make test_online:		Uses pytest on all test files with the name formatted 'online*test*.py'" \
			"make test:			Uses pytest on all tests found with either of the above name formats." \
			"make env:			Creates a python virtual environment with the necessary dependencies."

.PHONY: test_offline
test_offline:
	pytest $(shell find . -name offline*test*.py)

.PHONY: test_online
test_online:
	pytest $(shell find . -name online*test*.py)

.PHONY: test
test: test_offline test_online

.PHONY: env
env:
	@-rm -rf activate
	python -m venv env && \
	source env/bin/activate && \
	pip install -r requirements.txt && \
	ln env/bin/activate activate
	@echo "\n\nUse source ./activate to enter the environment\n"