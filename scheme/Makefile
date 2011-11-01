#!/usr/bin/make

TARGETS := xml2sexp.out

all:	build install clean

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
