# Project management tasks.

PROJECT_NAME = cmake-module
PROJECT_ROOT = /tmp/$(PROJECT_NAME)
BUILD_TYPE = Debug
BUILD_ROOT = build/$(BUILD_TYPE)
DOCKER = docker run --rm -u $${UID} -v $${PWD}:$(PROJECT_ROOT) $(PROJECT_NAME):latest


.PHONY: dev
dev:
	docker build --tag=$(PROJECT_NAME):latest .


.PHONY: build
build:
	$(DOCKER) bash -c 'cd $(BUILD_ROOT) && cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -S $(PROJECT_ROOT) -B . && cmake --build .'


# Run tests.
.PHONY: test
test: build
	$(DOCKER) bash -c 'cd $(BUILD_ROOT) && ctest'
