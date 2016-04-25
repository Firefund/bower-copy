BINSRC_DIR=./bin_src
SHELLSTUB=$(BINSRC_DIR)/shell_stub.txt
BINSRC=$(BINSRC_DIR)/cmd.js
BINOUTPUT=./bin/cmd.js


all: **/*.js *.js
.phony: bin
main: bin

%.js: %.coffee
	npm run coffee -- ./$<

bin:
	cat $(SHELLSTUB) $(BINSRC) > $(BINOUTPUT)

