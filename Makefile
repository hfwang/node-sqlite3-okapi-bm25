SPEC = spec/spec.js

test:
	./node_modules/mocha/bin/_mocha spec --check-leaks -R spec

test-w:
	./node_modules/.bin/_mocha --watch --growl --reporter min spec

lint:
	node_modules/.bin/jshint index.js spec

init-testing update-testing:
	npm install

.PHONY: test test-w init-testing update-testing
