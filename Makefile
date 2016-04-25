BINSRC_DIR=./bin_src
SHELLSTUB=$(BINSRC_DIR)/shell_stub.txt
BINSRC=$(BINSRC_DIR)/cmd.js
BINOUTPUT=./bin/cmd.js

all: **/*.coffee bin

%.js: %.coffee
	coffee -c $<

bin: compile
	cat $(SHELLSTUB) $(BINSRC) > $(BINOUTPUT)

