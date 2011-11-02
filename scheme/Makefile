#!/usr/bin/make

TARGETS := cabocha2sxml.out corenlp2sxml.out search-sxml.out

all:	build install #clean

build:		$(TARGETS)
install:	$(TARGETS:.out=.install)
clean:		$(TARGETS:.out=.clean)
cleanall:	$(TARGETS:.out=.cleanall)

%.out:	%.scm
	csc -O2 $^ -o $@

%.install:	%.out
	install $^ ../bin/$*

%.clean:
	rm -f $*.out

%.cleanall:	%.clean
	rm -f ../bin/$*

.PHONY: build install clean cleanall %.out %.install %.clean %.cleanall
