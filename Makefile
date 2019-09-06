VERSION?=latest

all:
	make -C postgis all

build:
	make -C postgis build
