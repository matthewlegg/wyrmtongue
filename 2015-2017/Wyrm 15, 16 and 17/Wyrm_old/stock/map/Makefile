.PHONY: clean all

all: placeholder.pdf

placeholder.pdf : map.tikz

%.pdf : %.latex
	pdflatex $<

clean:
	-rm -f *.log *.aux *.out *.pdf
