.PHONY: test
test: build
	cd demo && python2.7 hello-test.py

.PHONY: build
build:
	mkdir -p build
	cd build && cmake .. && make install

