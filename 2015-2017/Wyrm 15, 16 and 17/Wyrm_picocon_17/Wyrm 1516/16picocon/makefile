SOURCES=$(wildcard *.sty) $(wildcard articles/*) $(wildcard pictures/*) $(wildcard puzzles/*) $(wildcard adverts/*) $(wildcard ../stock/logo/*)
PSOURCES=$(SOURCES:.png=.eps)
EPSOURCES=$(PSOURCES:.jpg=.eps)
DEPSOURCES=$(EPSOURCES:.svg=.eps)
LATEXARGS=

.PHONY: all clean
.INTERMEDIATE: %.aux %.dvi %.log
.SUFFIXES:
.DEFAULT: all

%.pdf : %.dvi $(DEPSOURCES)
	dvipdf $<

%.dvi : %.latex $(DEPSOURCES)
	latex $(LATEXARGS) $<

%.eps : %.png
	convert $< $@

%.eps : %.jpg
	convert $< $@

%.eps : %.svg
	convert $< $@

all: wyrmtongue.pdf

clean:
	-rm -f wyrmtongue.pdf
	-rm -f wyrmtongue.aux
	-rm -f wyrmtongue.log
	-rm -f wyrmtongue.dvi

