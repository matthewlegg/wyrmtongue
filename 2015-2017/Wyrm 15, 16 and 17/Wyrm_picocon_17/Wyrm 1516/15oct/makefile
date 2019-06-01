SOURCES=$(wildcard *.sty) $(wildcard articles/*) $(wildcard pictures/*) $(wildcard puzzles/*) $(wildcard adverts/*) $(wildcard ../stock/logo/*)
EPSOURCES=$(SOURCES:.png=.eps)
DEPSOURCES=$(EPSOURCES:.jpg=.eps)
LATEXARGS=
WIDTH=$(shell tput cols)

.PHONY: all clean
.INTERMEDIATE: %.aux %.dvi %.log
.SUFFIXES:
.DEFAULT: all

%.pdf : %.dvi $(DEPSOURCES)
	dvipdf $<

%.dvi : %.latex $(DEPSOURCES)
	max_print_line=$(WIDTH) latex $(LATEXARGS) $<

%.eps : %.png
	convert $< $@

%.eps : %.jpg
	convert $< $@

all: wyrmtongue.pdf

clean:
	-rm -f wyrmtongue.pdf
	-rm -f wyrmtongue.aux
	-rm -f wyrmtongue.log
	-rm -f wyrmtongue.dvi

