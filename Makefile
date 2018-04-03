VERSION = $(shell  if [ $TAG = "" ]; then echo "0.0.1"; else echo "$TAG"; fi)
SRC_PATH=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

version:
	echo $(VERSION)

clean: 
	rm -rf\
	 $(SRC_PATH)/node_modules\

down: 
	docker-compose down
	docker-compose rm

up: clean down
	docker-compose up --build