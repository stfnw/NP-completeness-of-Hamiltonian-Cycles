# reproducible, but only when called through makefile with `make` and not when initially called through `latexmk`
export SOURCE_DATE_EPOCH := $(shell git show --no-patch --format=%ct HEAD)

.PHONY: all clean

GSFLAGS = -q -dPDF -dBATCH -dNOPAUSE -dSAFER -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress

all:
	latexmk

clean:
	latexmk -C


# makes graphviz output reproducible by replacing the timestamp
# graphviz doesn't honor SOURCE_DATE_EPOCH, but ghostscript does
%.pdf: %.pdf-temp
	gs $(GSFLAGS) -sOutputFile="$@" $^

%.pdf-temp: %.dot
	dot -Tpdf $< > $@
